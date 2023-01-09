//
//  StoreGoalViewController.swift
//  KeepGoEat-iOS
//
//  Created by 양정연 on 2022/12/30.
//

import UIKit

import SwiftUI

enum StoreSection {
    case main
}
enum SortType: String {
    case all
    case more
    case less
}

class StoreGoalViewController: UIViewController {
    
    // MARK: - Variables
    let data: GetStoreGoalResponse = getStoreGoalDataList[1]
    var dataSource: UICollectionViewDiffableDataSource<StoreSection, StoreGoal>!
    
    // MARK: Component
    private let storeGoalView = StoreGoalView()

    // MARK: - Function
    // MARK: LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setDataSource()
        applySnapshot(sort: .all)
        setAddTarget()
    }
    override func loadView() {
        super.loadView()
        
        self.view = storeGoalView
    }
    
    // MARK: Custom Function
    private func setDataSource() {
        dataSource = UICollectionViewDiffableDataSource<StoreSection, StoreGoal>(collectionView: storeGoalView.storeCollectionView, cellProvider: { collectionView, indexPath, goal in
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: StoreCollectionViewCell.identifier, for: indexPath) as? StoreCollectionViewCell else { fatalError() }
            cell.dataBind(data: goal)
            return cell
        })
    }
    private func applySnapshot(sort: SortType, isAnimated: Bool = true) {
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
    
    private func setAddTarget() {
        storeGoalView.totalButton.addTarget(self, action: #selector(totalButtonDidTap), for: .touchUpInside)
        storeGoalView.moreButton.addTarget(self, action: #selector(moreButtonDidTap), for: .touchUpInside)
        storeGoalView.lessButton.addTarget(self, action: #selector(lessButtonDidTap), for: .touchUpInside)
    }
    
    @objc
    private func totalButtonDidTap() {
        applySnapshot(sort: .all)
        storeGoalView.totalButton.setUI(title: Const.String.storeFilterAll, selectType: .selected)
        storeGoalView.moreButton.setUI(title: Const.String.storeFilterMore, selectType: .unselected)
        storeGoalView.lessButton.setUI(title: Const.String.storeFilterLess, selectType: .unselected)
    }
    @objc
    private func moreButtonDidTap() {
        applySnapshot(sort: .more)
        storeGoalView.totalButton.setUI(title: Const.String.storeFilterAll, selectType: .unselected)
        storeGoalView.moreButton.setUI(title: Const.String.storeFilterMore, selectType: .selected)
        storeGoalView.lessButton.setUI(title: Const.String.storeFilterLess, selectType: .unselected)
    }
    @objc
    private func lessButtonDidTap() {
        applySnapshot(sort: .less)
        storeGoalView.totalButton.setUI(title: Const.String.storeFilterAll, selectType: .unselected)
        storeGoalView.moreButton.setUI(title: Const.String.storeFilterMore, selectType: .unselected)
        storeGoalView.lessButton.setUI(title: Const.String.storeFilterLess, selectType: .selected)
    }
}

struct StoreGoalViewControllerPreView: PreviewProvider {
    static var previews: some View {
        StoreGoalViewController().toPreview()
    }
}
