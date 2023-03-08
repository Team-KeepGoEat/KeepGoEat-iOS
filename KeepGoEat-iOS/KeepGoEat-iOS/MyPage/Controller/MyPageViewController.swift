//
//  MyPageViewController.swift
//  KeepGoEat-iOS
//
//  Created by 정채은 on 2023/03/03.
//

import UIKit

import SnapKit
import Then

class MyPageViewController: BaseViewController {
    
//    private var accountInfoView = AccountInfoView()

    
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
//        self.view = accountInfoView
    }
    
    private func setDelegate() {
//        accountInfoView.handleWithdrawalButtonDelegate = self
//        accountInfoView.headerView.handleBackButtonDelegate = self
    }
}

extension MyPageViewController: HandleWithdrawalButtonDelegate {
//    func pushWithdrawal() {
//        self.navigationController?.pushViewController(WithdrawalViewController(), animated: true)
    }
}


extension MyPageViewController: HandleBackButtonDelegate {
    func popView() {
        self.navigationController?.popViewController(animated: true)
    }
}
