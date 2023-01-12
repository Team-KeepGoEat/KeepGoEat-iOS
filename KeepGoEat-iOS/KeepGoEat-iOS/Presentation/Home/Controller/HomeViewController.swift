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

extension HomeViewController: CustomButtonHandleDelegate {
    func showHomeBottomSheet() {
        self.showBottomSheet(bottomSheetView: homeView.bottomSheetView, dimmedView: homeView.dimmedView)
        homeView.bottomSheetView.isHidden = false
    }
    func playHomeLottie() {
        self.homeView.homeCheerView.playHomeLottie()
    }
}

// MARK: Preview
struct HomeViewControllerPreView: PreviewProvider {
    static var previews: some View {
        HomeViewController().toPreview()
    }
}
