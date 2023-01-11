//
//  HomeViewController.swift
//  KeepGoEat-iOS
//
//  Created by 양정연 on 2022/12/27.
//

import UIKit
import SwiftUI

class HomeViewController: UIViewController {
    
    // MARK: - Variables
    // MARK: Component
    private let homeView = HomeView()

    // MARK: - Function
    // MARK: LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        // API 연결 후 뷰 업데이트를 위해 사용 예정
        homeView.updateCheerBackgroundUI(timezoneType: .sun)
        setDelegate()
        setAddTarget()
        setupGestureRecognizer()
    }
    
    override func loadView() {
        super.loadView()
        
        self.view = homeView
    }
    
    private func setDelegate() {
        homeView.homeExistView.homeGoalCollectionView.addGoalDelegate = self
    }
    private func setAddTarget() {
        homeView.homeEmptyView.addGoalButton.addTarget(self, action: #selector(addGoalButtonDidTap), for: .touchUpInside)
    }
    private func setupGestureRecognizer() {
            let dimmedTap = UITapGestureRecognizer(target: self, action: #selector(dimmedViewTapped(_: )))
        homeView.dimmedView.addGestureRecognizer(dimmedTap)
        homeView.dimmedView.isUserInteractionEnabled = true
    }
    
    @objc func addGoalButtonDidTap() {
        showHomeBottomSheet()
    }
    @objc private func dimmedViewTapped(_ tapRecognizer: UITapGestureRecognizer) {
        self.hideBottomSheet(bottomSheetView: homeView.bottomSheetView, dimmedView: homeView.dimmedView)
        homeView.bottomSheetView.isHidden = true
    }
}

extension HomeViewController: addGoalViewHandleDelegate {
    func showHomeBottomSheet() {
        self.showBottomSheet(bottomSheetView: homeView.bottomSheetView, dimmedView: homeView.dimmedView)
        homeView.bottomSheetView.isHidden = false
    }
}

// MARK: Preview
struct HomeViewControllerPreView: PreviewProvider {
    static var previews: some View {
        HomeViewController().toPreview()
    }
}
