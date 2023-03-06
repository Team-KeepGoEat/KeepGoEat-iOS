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
    
    private var accountInfoView = AccountInfoView()
    private var withdrawalView = WithdrawalView()

    var alertView: UIView! = LogoutAlertView()
    
    // MARK: LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    override func loadView() {
        super.loadView()
        self.view = withdrawalView
    }
}
