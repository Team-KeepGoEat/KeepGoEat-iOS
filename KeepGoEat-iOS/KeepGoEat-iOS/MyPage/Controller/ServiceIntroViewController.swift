//
//  ServiceIntroViewController.swift
//  KeepGoEat-iOS
//
//  Created by 정채은 on 2023/03/14.
//

import UIKit

import Then
import SnapKit

class ServiceIntroViewController: BaseViewController {

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
        serviceIntroView.headerView.handleBackButtonDelegate = self
    }
}

extension ServiceIntroViewController: HandleBackButtonDelegate {
    func popView() {
        self.navigationController?.popViewController(animated: true)
    }
}
