//
//  LoginViewController.swift
//  KeepGoEat-iOS
//
//  Created by 양정연 on 2022/12/27.
//

import UIKit

class LoginViewController: UIViewController {
    
    // MARK: Component
    private let loginImageView: UIImageView = UIImageView().then {
        $0.image = UIImage(named: "imgSignup")
    }
    
    private let loginButton: SocialLoginButton = SocialLoginButton(frame: CGRect(), socialType: .KAKAO)

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setLayout()
    }
}

extension LoginViewController {
    private func setLayout() {
        view.addSubviews(
            loginImageView,
            loginButton
        )
        
        loginImageView.snp.makeConstraints {
            $0.width.equalToSuperview()
            $0.top.equalTo(view.safeAreaLayoutGuide).inset(150)
        }
        
        loginButton.snp.makeConstraints {
            $0.directionalHorizontalEdges.equalToSuperview().inset(16)
            $0.bottom.equalToSuperview().inset(34)
        }
    }
}
