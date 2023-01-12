//
//  SplashViewController.swift
//  KeepGoEat-iOS
//
//  Created by 이승헌 on 2023/01/01.
//

import UIKit

import KakaoSDKCommon
import KakaoSDKAuth
import KakaoSDKUser

class SplashViewController: BaseViewController {
    
    private let splashView: SplashView = SplashView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func loadView() {
        super.loadView()
        
        self.view = splashView
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 1) {
            if AuthApi.hasToken() {
                UserApi.shared.accessTokenInfo { (_, error) in
                    if let error = error {
                        if let sdkError = error as? SdkError, sdkError.isInvalidTokenError() == true {
                            changeRootViewController(navigationMode: .login)
                        } else {
                            print(error)
                        }
                    } else {
                        changeRootViewController(navigationMode: .home)
                    }
                }
            } else {
                changeRootViewController(navigationMode: .login)
            }
        }
    }
}
