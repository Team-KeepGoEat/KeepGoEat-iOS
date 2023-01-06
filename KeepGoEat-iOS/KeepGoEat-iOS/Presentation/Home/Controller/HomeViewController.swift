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

        setLayout()
    }
    
    override func loadView() {
        super.loadView()
        
        self.view = homeView
    }
    
    // MARK: Layout Helpers
    private func setLayout() {
        
    }
}

// MARK: Preview
struct HomeViewControllerPreView: PreviewProvider {
    static var previews: some View {
        HomeViewController().toPreview()
    }
}
