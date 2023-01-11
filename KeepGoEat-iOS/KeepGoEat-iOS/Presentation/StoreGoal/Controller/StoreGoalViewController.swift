//
//  StoreGoalViewController.swift
//  KeepGoEat-iOS
//
//  Created by 양정연 on 2022/12/30.
//

import UIKit

import SwiftUI

class StoreGoalViewController: UIViewController {
    
    // MARK: - Variables
    // MARK: Component
    private let storeGoalView = StoreGoalView()

    // MARK: - Function
    // MARK: LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        getStoreGoalData()
        setAddTarget()
    }
    override func loadView() {
        super.loadView()
        
        self.view = storeGoalView
    }
    
    // MARK: Custom Function
    private func getStoreGoalData() {
        StoreGoalService.shared.getStoreGoal(sortType: .all) { data in
            guard let data = data else { return }
            self.storeGoalView.data = data
            self.storeGoalView.applySnapshot(sort: .all)
        }
    }
    
    private func setAddTarget() {
        storeGoalView.totalButton.addTarget(self, action: #selector(totalButtonDidTap), for: .touchUpInside)
        storeGoalView.moreButton.addTarget(self, action: #selector(moreButtonDidTap), for: .touchUpInside)
        storeGoalView.lessButton.addTarget(self, action: #selector(lessButtonDidTap), for: .touchUpInside)
    }
    
    @objc
    private func totalButtonDidTap() {
        storeGoalView.applySnapshot(sort: .all)
        storeGoalView.totalButton.setUI(title: Const.String.storeFilterAll, selectType: .selected)
        storeGoalView.moreButton.setUI(title: Const.String.moreEat, selectType: .unselected)
        storeGoalView.lessButton.setUI(title: Const.String.lessEat, selectType: .unselected)
    }
    @objc
    private func moreButtonDidTap() {
        storeGoalView.applySnapshot(sort: .more)
        storeGoalView.totalButton.setUI(title: Const.String.storeFilterAll, selectType: .unselected)
        storeGoalView.moreButton.setUI(title: Const.String.moreEat, selectType: .selected)
        storeGoalView.lessButton.setUI(title: Const.String.lessEat, selectType: .unselected)
    }
    @objc
    private func lessButtonDidTap() {
        storeGoalView.applySnapshot(sort: .less)
        storeGoalView.totalButton.setUI(title: Const.String.storeFilterAll, selectType: .unselected)
        storeGoalView.moreButton.setUI(title: Const.String.moreEat, selectType: .unselected)
        storeGoalView.lessButton.setUI(title: Const.String.lessEat, selectType: .selected)
    }
}

struct StoreGoalViewControllerPreView: PreviewProvider {
    static var previews: some View {
        StoreGoalViewController().toPreview()
    }
}
