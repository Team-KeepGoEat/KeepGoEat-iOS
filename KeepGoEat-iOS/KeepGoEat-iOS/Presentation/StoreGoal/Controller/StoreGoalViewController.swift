//
//  StoreGoalViewController.swift
//  KeepGoEat-iOS
//
//  Created by 양정연 on 2022/12/30.
//

import UIKit

import SnapKit
import Then

class StoreGoalViewController: BaseViewController {
    
    // MARK: - Variables
    var data: GetStoreGoalResponse = getStoreGoalDataList[0]
    var dataSource: UICollectionViewDiffableDataSource<StoreSection, StoreGoal>!
    var sortType: SortType = .all
    
    // MARK: Component
    let headerView = HeaderView()
    private let headerLabel = UILabel().then {
        $0.font = .system4Bold
        $0.textColor = .gray800
        $0.text = Const.String.storeTitle
    }
    let totalButton = StoreFilterButton(frame: .zero, title: Const.String.storeFilterAll, selectType: .selected)
    let moreButton = StoreFilterButton(frame: .zero, title: Const.String.moreEat, selectType: .unselected)
    let lessButton = StoreFilterButton(frame: .zero, title: Const.String.lessEat, selectType: .unselected)
    private let layout = UICollectionViewFlowLayout().then {
        $0.estimatedItemSize = CGSize(width: 343.adjustedWidth, height: 160.adjustedWidth)
        $0.minimumLineSpacing = 16.adjusted
        $0.sectionInset = UIEdgeInsets(top: 3.adjusted, left: 0, bottom: 16.adjusted, right: 0)
    }
    lazy var storeCollectionView = StoreCollectionView(frame: .zero, collectionViewLayout: layout)
    
    // Empty View Components
    private let grayPlateImage: UIImageView = UIImageView().then {
        $0.image = Const.Image.plateGrayView1
    }
    private let emptyTitleLabel: UILabel = UILabel().then {
        $0.textColor = .gray500
        $0.font = .system3Bold
        $0.text = Const.String.storeEmptyTitle
    }
    private let emptySubLabel: UILabel = UILabel().then {
        $0.textColor = .gray500
        $0.font = .system4
        $0.text = Const.String.storeEmptySub
        $0.numberOfLines = 2
        $0.textAlignment = .center
    }

    // MARK: - Function
    // MARK: LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setDataSource()
        setLayout()
        setUI()
        setAddTarget()
        setDelegate()
    }
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.setNavigationBarHidden(true, animated: true)
        getStoreGoalData()
    }
    
    // MARK: Layout Helpers
    private func setUI() {
        self.view.backgroundColor = .gray50
        if data.goalCount == 0 {
            storeCollectionView.isHidden = true
            [grayPlateImage, emptyTitleLabel, emptySubLabel].forEach { $0.isHidden = false }
        } else {
            storeCollectionView.isHidden = false
            [grayPlateImage, emptyTitleLabel, emptySubLabel].forEach { $0.isHidden = true }
        }
    }
    private func setLayout() {
        emptySubLabel.setTextWithLineHeight(text: Const.String.storeEmptySub, lineHeight: 24)
        self.view.addSubviews(
            headerView,
            headerLabel,
            lessButton,
            moreButton,
            totalButton,
            storeCollectionView,
            grayPlateImage,
            emptyTitleLabel,
            emptySubLabel
        )
        
        headerView.snp.makeConstraints {
            $0.top.equalTo(self.view.safeAreaLayoutGuide)
            $0.height.equalTo(48.adjusted)
        }
        headerLabel.snp.makeConstraints {
            $0.top.equalTo(headerView.snp.bottom).offset(24.adjusted)
            $0.leading.equalToSuperview().offset(16.adjusted)
        }
        lessButton.snp.makeConstraints {
            $0.centerY.equalTo(headerLabel)
            $0.trailing.equalToSuperview().offset(-16.adjusted)
        }
        moreButton.snp.makeConstraints {
            $0.centerY.equalTo(headerLabel)
            $0.trailing.equalTo(lessButton.snp.leading).offset(-8.adjusted)
        }
        totalButton.snp.makeConstraints {
            $0.centerY.equalTo(headerLabel)
            $0.trailing.equalTo(moreButton.snp.leading).offset(-8.adjusted)
        }
        storeCollectionView.snp.makeConstraints {
            $0.top.equalTo(headerLabel.snp.bottom).offset(24.adjusted)
            $0.horizontalEdges.bottom.equalToSuperview()
        }
        grayPlateImage.snp.makeConstraints {
            $0.width.height.equalTo(140.adjusted)
            $0.center.equalToSuperview()
//            $0.top.equalTo(headerLabel.snp.bottom).offset(113.adjusted)
        }
        emptyTitleLabel.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(grayPlateImage.snp.bottom).offset(56.adjusted)
        }
        emptySubLabel.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(emptyTitleLabel.snp.bottom).offset(4.adjusted)
        }
    }
    
    // MARK: Custom Function
    private func setDataSource() {
        print("🚀setDataSource \(data)")
        dataSource = UICollectionViewDiffableDataSource<StoreSection, StoreGoal>(collectionView: storeCollectionView, cellProvider: { collectionView, indexPath, goal in
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: StoreCollectionViewCell.identifier, for: indexPath) as? StoreCollectionViewCell else { fatalError() }
            cell.dataBind(data: goal)
            cell.detailButton.tag = goal.goalId
            cell.detailButton.addTarget(self, action: #selector(self.detailButtonDidTap(sender: )), for: .touchUpInside)
            return cell
        })
    }
    
    func applySnapshot(sort: SortType, isAnimated: Bool = true) {
        print("🚀applySnapshot \(data)")
        var snapshot = NSDiffableDataSourceSnapshot<StoreSection, StoreGoal>()
        snapshot.appendSections([.main])
        switch sort {
        case .all:
            snapshot.appendItems(data.goals, toSection: .main)
            sortType = .all
        case .more:
            snapshot.appendItems(data.goals.filter({ $0.isMore }), toSection: .main)
            sortType = .more
        case .less:
            snapshot.appendItems(data.goals.filter({ !$0.isMore }), toSection: .main)
            sortType = .less
        }
        dataSource.apply(snapshot, animatingDifferences: isAnimated)
    }

    private func getStoreGoalData() {
        StoreGoalService.shared.getStoreGoal(sortType: .all) { data in
            guard let data = data else { return }
            self.data = data
            self.applySnapshot(sort: self.sortType)
            self.setUI()
        }
        print("🚀getStoreGoalData \(data)")
    }
    
    private func setAddTarget() {
        totalButton.addTarget(self, action: #selector(totalButtonDidTap), for: .touchUpInside)
        moreButton.addTarget(self, action: #selector(moreButtonDidTap), for: .touchUpInside)
        lessButton.addTarget(self, action: #selector(lessButtonDidTap), for: .touchUpInside)
    }
    
    private func setDelegate() {
        headerView.handleBackButtonDelegate = self
    }
    
    @objc
    private func totalButtonDidTap() {
        applySnapshot(sort: .all)
        totalButton.setUI(title: Const.String.storeFilterAll, selectType: .selected)
        moreButton.setUI(title: Const.String.moreEat, selectType: .unselected)
        lessButton.setUI(title: Const.String.lessEat, selectType: .unselected)
    }
    @objc
    private func moreButtonDidTap() {
        applySnapshot(sort: .more)
        totalButton.setUI(title: Const.String.storeFilterAll, selectType: .unselected)
        moreButton.setUI(title: Const.String.moreEat, selectType: .selected)
        lessButton.setUI(title: Const.String.lessEat, selectType: .unselected)
    }
    @objc
    private func lessButtonDidTap() {
        applySnapshot(sort: .less)
        totalButton.setUI(title: Const.String.storeFilterAll, selectType: .unselected)
        moreButton.setUI(title: Const.String.moreEat, selectType: .unselected)
        lessButton.setUI(title: Const.String.lessEat, selectType: .selected)
    }
    
    @objc func detailButtonDidTap(sender: UIButton) {
        let deleteActionSheet = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        deleteActionSheet.addAction(UIAlertAction(title: "삭제하기", style: .destructive, handler: { _ in
            let confirmAlert = UIAlertController(title: "삭제 하시겠어요?", message: "삭제된 목표와 달성 기록은\n다시 복구할 수 없어요.", preferredStyle: .alert)
            confirmAlert.addAction(UIAlertAction(title: "취소", style: .cancel))
            confirmAlert.addAction(UIAlertAction(title: "네", style: .destructive, handler: { _ in
                self.deleteStoreGoal(goalId: sender.tag)
            }))
            self.present(confirmAlert, animated: true)
        }))
        deleteActionSheet.addAction(UIAlertAction(title: "취소", style: .cancel))
        self.present(deleteActionSheet, animated: true)
    }
    
    private func deleteStoreGoal(goalId: Int) {
        GoalDetailService.shared.deleteGoal(goalId: goalId) { _ in
            self.getStoreGoalData()
        }
    }
}

extension StoreGoalViewController: HandleBackButtonDelegate {
    func popView() {
        self.navigationController?.popViewController(animated: true)
    }
}
