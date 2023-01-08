//
//  OnboardingViewController.swift
//  KeepGoEat-iOS
//
//  Created by 양정연 on 2022/12/27.
//

import UIKit

import SnapKit
import Then

class OnboardingViewController: UIViewController {
    
    // MARK: - Variables
    var onboardingData: [OnboardingDataModel] = []
    var currentPage: Int = 0 {
        didSet {
            pageControl.currentPage = currentPage
            switch currentPage {
            case 0:
                nextButton.setTitle("조금 더 설명해주세요!", for: .normal)
            case 1:
                nextButton.setTitle("매일 기록에 실패하면 어쩌죠?", for: .normal)
            case 2:
                nextButton.setTitle("KEEP GO EAT 시작하기", for: .normal)
            default:
                print("잘못된 값이 들어와쪄염")
            }
        }
    }
    
    // MARK: - UI Components
    private lazy var passButton = UIButton().then {
        $0.setTitle("건너뛰기", for: .normal)
        $0.titleLabel?.font = .system5
        $0.setTitleColor(.gray400, for: .normal)
        $0.backgroundColor = .clear
    }
    
    private let pageControl = UIPageControl().then {
        $0.hidesForSinglePage = true
        $0.numberOfPages = 3
        $0.pageIndicatorTintColor = .gray300
        $0.isUserInteractionEnabled = false
        $0.currentPageIndicatorTintColor = .orange600
        $0.isUserInteractionEnabled = false
    }
    
    private let collectionViewLayout: UICollectionViewFlowLayout = UICollectionViewFlowLayout().then {
        $0.minimumLineSpacing = 0
        $0.scrollDirection = .horizontal
    }
    
    private lazy var onboardingCollectionView: UICollectionView = UICollectionView(frame: .zero, collectionViewLayout: collectionViewLayout).then {
        $0.backgroundColor = .clear
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.isScrollEnabled = true
        $0.isPagingEnabled = true
        $0.showsHorizontalScrollIndicator = false
        $0.delegate = self
        $0.dataSource = self
    }

    private lazy var nextButton = UIButton().then {
        $0.setTitle("조금 더 설명해주세요!", for: .normal)
        $0.titleLabel?.font = .system4Bold
        $0.setTitleColor(.white, for: .normal)
        $0.backgroundColor = .orange600
        $0.layer.cornerRadius = 9.adjusted
    }
    
    // MARK: - Constants
    final let kOnboardingInset: UIEdgeInsets = UIEdgeInsets(top: 84.adjusted, left: 0, bottom: 199.adjusted, right: 0)
    final let kOnboardingLineSpacing: CGFloat = 0
    final let kOnboardingItemSpacing: CGFloat = 0
    final let kCellHeight: CGFloat = 364
    
    override func viewDidLoad() {
        super.viewDidLoad()
        layout()
        register()
        setAddTarget() 
    }
}

// MARK: - extension
extension OnboardingViewController {
    
    // MARK: - Layout Helpers
    private func layout() {
        view.backgroundColor = .white
        [pageControl, passButton, nextButton].forEach {
            view.addSubview($0)
        }
        view.addSubview(onboardingCollectionView)

        pageControl.snp.makeConstraints {
            $0.top.equalTo(self.view.safeAreaLayoutGuide).offset(14.adjusted)
            $0.centerX.equalToSuperview()
        }
        
        passButton.snp.makeConstraints {
            $0.centerY.equalTo(pageControl)
            $0.trailing.equalTo(self.nextButton.snp.trailing)
            $0.height.equalTo(21.adjusted)
            $0.width.equalTo(49.adjusted)
        }
        
       onboardingCollectionView.snp.makeConstraints {
           $0.top.equalTo(self.pageControl.snp.bottom).offset(55.adjusted)
           $0.leading.trailing.equalToSuperview()
           $0.height.equalTo(471.adjusted)
        }
        
        nextButton.snp.makeConstraints {
            $0.bottom.equalToSuperview().inset(44.adjusted)
            $0.centerX.equalToSuperview()
            $0.width.equalTo(343.adjusted)
            $0.height.equalTo(48.adjusted)
        }
    }
    
    private func register() {
        onboardingCollectionView.register(OnboardingCollectionViewCell.self, forCellWithReuseIdentifier: OnboardingCollectionViewCell.identifier)
    }
    
    private func setAddTarget() {
        nextButton.addTarget(self, action: #selector(tapNextButton), for: .touchUpInside)
    }
    
    @objc
    private func tapNextButton() {
        if currentPage == onboardingData.count - 1 {
            print("go to main")
        } else {
            currentPage += 1
            let indexPath = IndexPath(item: currentPage, section: 0)
            onboardingCollectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
        }
    }
}

// MARK: - Custom Functions
extension OnboardingViewController: UICollectionViewDelegateFlowLayout {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let width = scrollView.frame.width
        currentPage = Int(scrollView.contentOffset.x / width)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: UIScreen.main.bounds.width, height: collectionView.frame.height)
    }
}

extension OnboardingViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return onboardingList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let onboardingCell = collectionView.dequeueReusableCell(withReuseIdentifier: OnboardingCollectionViewCell.identifier, for: indexPath) as? OnboardingCollectionViewCell else { return UICollectionViewCell() }
        
        onboardingCell.dataBind(model: onboardingList[indexPath.item])
        return onboardingCell
            
    }
}
