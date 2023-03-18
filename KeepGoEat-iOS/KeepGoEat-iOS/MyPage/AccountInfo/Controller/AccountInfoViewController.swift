//
//  AccountInfoViewController.swift
//  KeepGoEat-iOS
//
//  Created by 정채은 on 2023/03/08.
//

import UIKit

import SnapKit
import Then

class AccountInfoViewController: BaseViewController {
    
    private var accountInfoView = AccountInfoView()
    private var withdrawalView = WithdrawalView()

    var alertView: UIView! = LogoutAlertView()
    
    // MARK: LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setDelegate()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.setNavigationBarHidden(true, animated: true)
        getMyPage()
    }
    
    override func loadView() {
        super.loadView()
        self.view = accountInfoView
    }
    
    private func setDelegate() {
        accountInfoView.handleWithdrawalButtonDelegate = self
        accountInfoView.headerView.handleBackButtonDelegate = self
    }
    
    private func getMyPage() {
        MyPageService.shared.getMyPage { data in
            guard let data = data else { return }
            self.accountInfoView.accountLabel.text = String(data.name)
            self.accountInfoView.emailLabel.text = String(data.email)
        }
    }
}

extension AccountInfoViewController: HandleWithdrawalButtonDelegate {
    func pushWithdrawal() {
        self.navigationController?.pushViewController(WithdrawalViewController(), animated: true)
    }
}

extension AccountInfoViewController: HandleBackButtonDelegate {
    func popView() {
        self.navigationController?.popViewController(animated: true)
    }
}
