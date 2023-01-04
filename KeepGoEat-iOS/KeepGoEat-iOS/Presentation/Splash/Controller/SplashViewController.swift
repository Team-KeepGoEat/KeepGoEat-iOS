//
//  SplashViewController.swift
//  KeepGoEat-iOS
//
//  Created by 이승헌 on 2023/01/01.
//

import UIKit

class SplashViewController: UIViewController {
    
    private let splashView: SplashView = SplashView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func loadView() {
        super.loadView()
        
        self.view = splashView
    }
}
