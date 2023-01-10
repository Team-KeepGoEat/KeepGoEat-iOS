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
    }
    
    override func loadView() {
        super.loadView()
        
        self.view = homeView
    }
    
    @objc func addGoalButtonDidTap() {
        print("안녕하세요옹옹")
        self.showBottomSheet(bottomSheetView: homeView.bottomSheetView, dimmedView: homeView.dimmedView)
    }
    @objc private func dimmedViewTapped(_ tapRecognizer: UITapGestureRecognizer) {
        self.hideBottomSheet(bottomSheetView: homeView.bottomSheetView, dimmedView: homeView.dimmedView)
        homeView.bottomSheetView.isHidden = true
    }
}

// MARK: Preview
struct HomeViewControllerPreView: PreviewProvider {
    static var previews: some View {
        HomeViewController().toPreview()
    }
}
