//
//  GoalDetailViewController.swift
//  KeepGoEat-iOS
//
//  Created by 양정연 on 2022/12/27.
//

import UIKit

class GoalDetailViewController: UIViewController {
    
    private let goalDetailView: GoalDetailView = GoalDetailView(frame: CGRect(), goalType: .more)

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func loadView() {
        self.view = goalDetailView
    }
}
