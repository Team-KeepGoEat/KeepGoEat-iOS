//
//  LoginViewController.swift
//  KeepGoEat-iOS
//
//  Created by 양정연 on 2022/12/27.
//

import UIKit

import KakaoSDKUser

class LoginViewController: UIViewController {
    
    // MARK: Component
    private let loginImageView: UIImageView = UIImageView().then {
        $0.image = UIImage(named: "imgSignup")
    }
    
    private let loginButton: SocialLoginButton = SocialLoginButton(frame: CGRect(), socialType: .kakao)
    
    private let logoutButton: UIButton = UIButton().then {
        $0.backgroundColor = .kakako
        $0.setTitle("로그아웃", for: .normal)
        $0.titleLabel?.textAlignment = .center
        $0.layer.cornerRadius = 8
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
        setLayout()
        setAddTarget()
    }
}

extension LoginViewController {
    private func setUI() {
        view.backgroundColor = .white
    }
    
    private func setLayout() {
        view.addSubviews(
            loginImageView,
            logoutButton,
            loginButton
        )
        
        loginImageView.snp.makeConstraints {
            $0.width.equalTo(360.adjusted)
            $0.height.equalTo(328.adjusted)
            $0.centerY.equalTo(view.safeAreaLayoutGuide)
            $0.centerX.equalTo(view.safeAreaLayoutGuide)
        }
        
        logoutButton.snp.makeConstraints {
            $0.directionalHorizontalEdges.equalToSuperview().inset(16)
            $0.top.equalTo(loginImageView.snp.bottom).inset(-34)
            $0.height.equalTo(48)
        }
        
        loginButton.snp.makeConstraints {
            $0.directionalHorizontalEdges.equalToSuperview().inset(16)
            $0.bottom.equalToSuperview().inset(34)
        }
    }
    
    private func setAddTarget() {
        logoutButton.addTarget(self, action: #selector(tapLogoutButton), for: .touchUpInside)
    }
    
    private func kakaoLogout() {
        UserApi.shared.logout {(error) in
            if let error = error {
                print(error)
            } else {
                print("logout() success.")
            }
        }
    }
    
    @objc
    private func tapLogoutButton() {
        kakaoLogout()
    }
}
