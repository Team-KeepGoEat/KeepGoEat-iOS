//
//  HomeViewController.swift
//  KeepGoEat-iOS
//
//  Created by 양정연 on 2022/12/27.
//

import UIKit
import SwiftUI

class HomeViewController: BaseViewController {
    
    // MARK: - Variables
    // MARK: Component
    private var homeView = HomeView()

    // MARK: - Function
    // MARK: LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        getHomeData()
        setDelegate()
        setAddTarget()
        setupGestureRecognizer()
    }
    
    override func loadView() {
        super.loadView()
        
        self.view = homeView
    }
    
    private func getHomeData() {
        HomeService.shared.getHome() { data in
            guard let data = data else { return }
            self.homeView.updateCheerBackgroundUI(timezoneType: TimezoneType(rawValue: data.daytime) ?? .day)
            if data.goalCount == 0 {
                self.homeView.homeType = .empty
            } else {
                self.homeView.homeType = .exist
                self.homeView.homeExistView.homeGoalCollectionView.data = data
                self.homeView.homeExistView.homeGoalCollectionView.reloadData()
            }
        }
    }
    private func setDelegate() {
        homeView.homeExistView.homeGoalCollectionView.customButtonDelegate = self
        homeView.homeCheerView.handleMyPageButtonDelegate = self
        homeView.homeBottomSheetView.moreBottomView.handleNewGoalButtonDelegate = self
        homeView.homeBottomSheetView.lessBottomView.handleNewGoalButtonDelegate = self
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

extension HomeViewController: HandleCustomButtonDelegate {
    func pushGoalDetail() {
        self.navigationController?.pushViewController(GoalDetailViewController(), animated: true)
    }
    func showHomeBottomSheet() {
        self.showBottomSheet(bottomSheetView: homeView.bottomSheetView, dimmedView: homeView.dimmedView)
        homeView.bottomSheetView.isHidden = false
    }
    func playHomeLottie() {
        self.homeView.homeCheerView.playHomeLottie()
    }
}

extension HomeViewController: HandleMyPageButtonDelegate {
    func pushMyPage() {
        self.navigationController?.pushViewController(StoreGoalViewController(), animated: true)
    }
}

extension HomeViewController: HandleNewGoalButtonDelegate {
    func pushNewGoalView(eatType: EatType) {
        print(eatType)
        self.navigationController?.pushViewController(NewGoalViewController(), animated: true)
    }
}

// MARK: Preview
struct HomeViewControllerPreView: PreviewProvider {
    static var previews: some View {
        HomeViewController().toPreview()
    }
}
