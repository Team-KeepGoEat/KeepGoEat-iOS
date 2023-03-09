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
    
    private var myPageView = MyPageView()
    
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
        self.view = myPageView
    }
    
    private func setDelegate() {
        myPageView.handleAccountButtonDelegate = self
        myPageView.headerView.handleBackButtonDelegate = self
    }
}

extension MyPageViewController: HandleAccountButtonDelegate {
    func pushAccountInfo() {
        self.navigationController?.pushViewController(AccountInfoViewController(), animated: true)
    }
}

extension MyPageViewController: HandleBackButtonDelegate {
    func popView() {
        self.navigationController?.popViewController(animated: true)
    }
}
