//
//  SplashViewController.swift
//  KeepGoEat-iOS
//
//  Created by 이승헌 on 2023/01/01.
//

import UIKit

import KakaoSDKAuth
import KakaoSDKUser

class SplashViewController: UIViewController {
    
    private let splashView: SplashView = SplashView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func loadView() {
        super.loadView()
        
        self.view = splashView
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 1) {
            if AuthApi.hasToken() {
                let homeViewController: HomeViewController = HomeViewController()
                
                if let window = self.view.window?.windowScene?.keyWindow {
                    window.rootViewController = homeViewController
                }
            } else {
                let loginViewController: LoginViewController = LoginViewController()
                
                if let window = self.view.window?.windowScene?.keyWindow {
                    window.rootViewController = loginViewController
                }
            }
        }
    }
}
