//
//  BaseViewController.swift
//  KeepGoEat-iOS
//
//  Created by 양정연 on 2022/12/27.
//

import UIKit

class BaseViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        style()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        setNavigationBar()
    }
    
    func style() {
        view.backgroundColor = .white
    }
    
    func setNavigationBar() {
        navigationController?.setNavigationBarHidden(true, animated: true)
    }
}
