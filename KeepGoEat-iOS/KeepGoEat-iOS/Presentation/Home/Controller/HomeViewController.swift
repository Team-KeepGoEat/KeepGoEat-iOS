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
}

// MARK: Preview
struct HomeViewControllerPreView: PreviewProvider {
    static var previews: some View {
        HomeViewController().toPreview()
    }
}
