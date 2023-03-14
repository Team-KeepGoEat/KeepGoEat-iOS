//
//  ServiceIntroViewController.swift
//  KeepGoEat-iOS
//
//  Created by 정채은 on 2023/03/14.
//

import UIKit

class ServiceIntroViewController: UIViewController {

    private var serviceIntroView = ServiceIntroView()
    
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
        self.view = serviceIntroView
    }
    
    private func setDelegate() {
//        serviceIntroView.handleAccountButtonDelegate = self
//        serviceIntroView.handleStoreGoalButtonDelegate = self
        serviceIntroView.headerView.handleBackButtonDelegate = self
    }
}

//extension ServiceIntroViewController: HandleAccountButtonDelegate {
//    func pushAccountInfo() {
//        self.navigationController?.pushViewController(AccountInfoViewController(), animated: true)
//    }
//}

extension ServiceIntroViewController: HandleBackButtonDelegate {
    func popView() {
        self.navigationController?.popViewController(animated: true)
    }
}

//extension ServiceIntroViewController: HandleStoreGoalButtonDelegate {
//    func pushStoreGoal() {
//        self.navigationController?.pushViewController(StoreGoalViewController(), animated: true)
//        print("durl")
//    }
//}
