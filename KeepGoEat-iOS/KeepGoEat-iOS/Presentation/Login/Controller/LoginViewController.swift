//
//  LoginViewController.swift
//  KeepGoEat-iOS
//
//  Created by 양정연 on 2022/12/27.
//

import UIKit

import KakaoSDKUser

class LoginViewController: UIViewController {
    
    // MAKR: Variables
    var loginResponse: LoginResponseDto?
    
    // MARK: Component
    private let loginImageView: UIImageView = UIImageView().then {
        $0.image = UIImage(named: "imgSignup")
    }
    
    private let loginButton: SocialLoginButton = SocialLoginButton(frame: CGRect(), socialType: .kakao)

    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
        setLayout()
    }
}

extension LoginViewController {
    private func setUI() {
        view.backgroundColor = .white
    }
    
    private func setLayout() {
        view.addSubviews(
            loginImageView,
            loginButton
        )
        
        loginImageView.snp.makeConstraints {
            $0.width.equalTo(360.adjusted)
            $0.height.equalTo(328.adjusted)
            $0.centerY.equalTo(view.safeAreaLayoutGuide)
            $0.centerX.equalTo(view.safeAreaLayoutGuide)
        }

        loginButton.snp.makeConstraints {
            $0.directionalHorizontalEdges.equalToSuperview().inset(16.adjusted)
            $0.bottom.equalToSuperview().inset(44.adjusted)
        }
    }
}
