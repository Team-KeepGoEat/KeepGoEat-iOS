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
            if let type = getSocialType() {
                if type == SocialType.kakao.rawValue {
                    UserApi.shared.accessTokenInfo { (_, error) in
                        if let error = error {
                            if let sdkError = error as? SdkError, sdkError.isInvalidTokenError() == true {
                                RootViewControllerSwithcer.shared.changeRootViewController(navigationMode: .login)
                            } else {
                                print(error)
                            }
                        } else {
                            RootViewControllerSwithcer.shared.changeRootViewController(navigationMode: .home)
                        }
                    }
                } else if type == SocialType.apple.rawValue {
                    RootViewControllerSwithcer.shared.changeRootViewController(navigationMode: .home)
                }
            } else {
                RootViewControllerSwithcer.shared.changeRootViewController(navigationMode: .login)
            }
        }
    }
}
