//
//  RootViewControllerSwitcher.swift
//  KeepGoEat-iOS
//
//  Created by 이승헌 on 2023/01/12.
//

import UIKit

enum NavigationMode {
    case splash
    case login
    case onboarding
    case home
}

func changeRootViewController(navigationMode: NavigationMode) {
    let sceneDelegate = UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate
    guard let delegate = sceneDelegate else { return }
    
    switch navigationMode {
    case .splash:
        delegate.window?.rootViewController = SplashViewController()
    case .login:
        delegate.window?.rootViewController = LoginViewController()
    case .onboarding:
        delegate.window?.rootViewController = OnboardingViewController()
    case .home:
        delegate.window?.rootViewController = UINavigationController(rootViewController: HomeViewController())
    }
}
