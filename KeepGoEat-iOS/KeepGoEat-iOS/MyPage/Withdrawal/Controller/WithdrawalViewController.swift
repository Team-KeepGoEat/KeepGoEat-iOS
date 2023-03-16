//
//  WithdrawalViewController.swift
//  KeepGoEat-iOS
//
//  Created by 정채은 on 2023/03/08.
//

import UIKit

import SnapKit
import Then


class WithdrawalViewController: BaseViewController {
    
    private var withdrawalView = WithdrawalView()
    
    // MARK: LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setDelegate()
    }
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    override func loadView() {
        super.loadView()
        self.view = withdrawalView

    }
    
    private func setDelegate() {
        withdrawalView.headerView.handleBackButtonDelegate = self
    }
}

extension WithdrawalViewController: HandleBackButtonDelegate {
    func popView() {
        self.navigationController?.popViewController(animated: true)
    }
}
