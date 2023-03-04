//
//  MyPageViewController.swift
//  KeepGoEat-iOS
//
//  Created by 정채은 on 2023/03/03.
//

import UIKit

class MyPageViewController: BaseViewController {
    
    private var accountInfoView = AccountInfoView()
    private var logoutAlertView = LogoutAlertView()

    // MARK: LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    override func loadView() {
        super.loadView()
        
        self.view = logoutAlertView
    }
}
