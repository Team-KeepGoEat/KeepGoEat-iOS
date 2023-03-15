//
//  StoreGoalView.swift
//  KeepGoEat-iOS
//
//  Created by 양정연 on 2023/01/08.
//

import UIKit

import SnapKit
import Then

enum StoreSection {
    case main
}

class StoreGoalView: UIView {
    
    // MARK: - Variables
    var data: GetStoreGoalResponse = getStoreGoalDataList[1]
    var dataSource: UICollectionViewDiffableDataSource<StoreSection, StoreGoal>!
    
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
    
    // MARK: - Function
    // MARK: LifeCycle
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setDataSource()
        setUI()
        setLayout()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: Layout Helpers
    private func setUI() {
        self.backgroundColor = .gray50
    }
    private func setLayout() {
        self.addSubviews(
            headerView,
            headerLabel,
            lessButton,
            moreButton,
            totalButton,
            storeCollectionView
        )
        
        headerView.snp.makeConstraints {
            $0.top.equalTo(self.safeAreaLayoutGuide)
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
    }
    
    // MARK: Custom Function
    private func setDataSource() {
        dataSource = UICollectionViewDiffableDataSource<StoreSection, StoreGoal>(collectionView: storeCollectionView, cellProvider: { collectionView, indexPath, goal in
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: StoreCollectionViewCell.identifier, for: indexPath) as? StoreCollectionViewCell else { fatalError() }
            cell.dataBind(data: goal)
            cell.detailButton.tag = goal.goalId
            cell.detailButton.addTarget(self, action: #selector(self.detailButtonDidTap(sender: )), for: .touchUpInside)
            return cell
        })
    }
    func applySnapshot(sort: SortType, isAnimated: Bool = true) {
        var snapshot = NSDiffableDataSourceSnapshot<StoreSection, StoreGoal>()
        snapshot.appendSections([.main])
        switch sort {
        case .all:
            snapshot.appendItems(data.goals, toSection: .main)
        case .more:
            snapshot.appendItems(data.goals.filter({ $0.isMore }), toSection: .main)
        case .less:
            snapshot.appendItems(data.goals.filter({ !$0.isMore }), toSection: .main)
        }
        dataSource.apply(snapshot, animatingDifferences: isAnimated)
    }
    
    @objc func detailButtonDidTap(sender: UIButton) {
        let deleteActionSheet = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        deleteActionSheet.addAction(UIAlertAction(title: "삭제하기", style: .destructive, handler: { _ in
            let confirmAlert = UIAlertController(title: "삭제 하시겠어요?", message: "삭제된 목표와 달성 기록은\n다시 복구할 수 없어요.", preferredStyle: .alert)
            confirmAlert.addAction(UIAlertAction(title: "취소", style: .cancel))
            confirmAlert.addAction(UIAlertAction(title: "네", style: .destructive, handler: { _ in
                self.deleteStoreGoal(goalId: sender.tag)
            }))
        }))
        deleteActionSheet.addAction(UIAlertAction(title: "취소", style: .cancel))
    }
    
    private func deleteStoreGoal(goalId: Int) {
        var snapshot = dataSource.snapshot()
        let target = data.goals.filter { $0.goalId == goalId }
        snapshot.deleteItems(target)
        dataSource.apply(snapshot)
    }
    
//    private func showDeleteActionSheet() {
//        let deleteActionSheet = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
//        deleteActionSheet.addAction(UIAlertAction(title: "삭제하기", style: .destructive, handler: { _ in
//            <#code#>
//        }))
//        deleteActionSheet.addAction(UIAlertAction(title: "취소", style: .cancel))
//    }
//
//    private func showConfirmAlert() {
//        let confirmAlert = UIAlertController(title: "삭제 하시겠어요?", message: "삭제된 목표와 달성 기록은\n다시 복구할 수 없어요.", preferredStyle: .alert)
//        confirmAlert.addAction(UIAlertAction(title: "취소", style: .cancel))
//        confirmAlert.addAction(UIAlertAction(title: "네", style: .destructive, handler: { _ in
//            <#code#>
//        }))
//    }
}
