//
//  StoreGoalViewController.swift
//  KeepGoEat-iOS
//
//  Created by 양정연 on 2022/12/30.
//

import UIKit

class StoreGoalViewController: UIViewController {
    
    // MARK: - Variables
    // MARK: Component
    private let storeGoalView = StoreGoalView()

    // MARK: - Function
    // MARK: LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    override func loadView() {
        super.loadView()
        
        self.view = storeGoalView
    }
    
}
