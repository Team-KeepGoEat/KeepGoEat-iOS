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
    }
    
    private let collectionViewLayout: UICollectionViewFlowLayout = UICollectionViewFlowLayout().then {
        $0.scrollDirection = .horizontal
    }
    
    private lazy var onboardingCollectionView: UICollectionView = UICollectionView(frame: .zero, collectionViewLayout: collectionViewLayout).then {
        $0.backgroundColor = .clear
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.isScrollEnabled = true
        $0.showsHorizontalScrollIndicator = false
    }

    private lazy var nextButton = UIButton().then {
        $0.setTitle("조금 더 설명해주세요!", for: .normal)
        $0.titleLabel?.font = .system4Bold
        $0.setTitleColor(.white, for: .normal)
        $0.backgroundColor = .orange600
        $0.layer.cornerRadius = 9
        pageControl.isUserInteractionEnabled = false
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        layout()
    }
}

extension OnboardingViewController {
    
    // MARK: - Layout Helpers
    private func layout() {
        view.backgroundColor = .white
        [pageControl, passButton, nextButton].forEach {
            view.addSubview($0)
        }
        view.addSubview(onboardingCollectionView)

        pageControl.snp.makeConstraints {
            $0.top.equalTo(self.view.safeAreaLayoutGuide).offset(14)
            $0.centerX.equalToSuperview()
        }
        
        passButton.snp.makeConstraints {
            $0.centerY.equalTo(pageControl)
            $0.leading.equalToSuperview().offset(303)
            $0.height.equalTo(21)
            $0.width.equalTo(49)
        }
        
       onboardingCollectionView.snp.makeConstraints {
           $0.top.equalTo(self.pageControl.snp.bottom).offset(55)
           $0.centerX.equalToSuperview()
           $0.height.equalTo(364)
        }
        
        nextButton.snp.makeConstraints {
            $0.top.equalTo(self.view.safeAreaLayoutGuide).offset(575)
            $0.centerX.equalToSuperview()
            $0.width.equalTo(343)
            $0.height.equalTo(48)
        }
    }
}
