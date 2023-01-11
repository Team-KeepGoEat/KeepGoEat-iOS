//
//  StoreGoalViewController.swift
//  KeepGoEat-iOS
//
//  Created by 양정연 on 2022/12/30.
//

import UIKit

class StoreGoalViewController: BaseViewController {
    
    private let storeGoalView = StoreGoalView()

    override func viewDidLoad() {
        super.viewDidLoad()

    }

    override func loadView() {
        self.view = storeGoalView
    }
    
}
