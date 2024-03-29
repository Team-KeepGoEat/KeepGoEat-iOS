//
//  SocialLoginButtonView.swift
//  KeepGoEat-iOS
//
//  Created by 이승헌 on 2023/01/01.
//

import UIKit

import KakaoSDKUser
import SnapKit

enum SocialType: String {
    case kakao
    case apple
}

class SocialLoginButton: UIButton {
    
    // MARK: - Variables
    private let socialType: SocialType
    
    private var platformAccessToken: String?
    
    private var platform: String?
    
    // MARK: Component
    private let socialLogo: UIImageView = UIImageView()
    
    private let socialLabel: UILabel = UILabel().then {
        $0.font = .system4Bold
    }
    
    init(frame: CGRect, socialType: SocialType) {
        self.socialType = socialType
        switch socialType {
        case .apple:
            platform = "APPLE"
        case .kakao:
            platform = "KAKAO"
        }
        super.init(frame: frame)
        setUI()
        setLayout()
        setAddTarget()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension SocialLoginButton {
    
    private func setUI() {
        self.layer.cornerRadius = 6
        switch socialType {
        case .apple:
            self.backgroundColor = .apple
            socialLogo.image = Const.Image.appleLogo
            socialLabel.text = Const.String.appleLogin
            socialLabel.textColor = .white
            
        case .kakao:
            self.backgroundColor = .kakako
            socialLogo.image = Const.Image.kakaoLogo
            socialLabel.text = Const.String.kakaoLogin
            socialLabel.textColor = .kakakoBlack
        }
    }
    
    private func setLayout() {
        self.addSubviews(
            socialLogo,
            socialLabel
        )
        
        self.snp.makeConstraints {
            $0.height.equalTo(48)
        }
        
        socialLogo.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.leading.equalToSuperview().inset(20.adjusted)
        }
        
        socialLabel.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.centerX.equalToSuperview()
        }
    }
    
    private func setAddTarget() {
        if socialType == .kakao {
            self.addTarget(self, action: #selector(tapKakaoLoginButton), for: .touchUpInside)
        }
    }
    
    private func kakaoTalkLogin() {
        // 카카오톡 설치 여부 확인
        if UserApi.isKakaoTalkLoginAvailable() {
            UserApi.shared.loginWithKakaoTalk {(oauthToken, error) in
                if let error = error {
                    print(error)
                } else {
                    print("login With KakaoTalk success")
                    
                    self.platformAccessToken = oauthToken?.accessToken ?? ""
                    print("👍platformAccessToken", oauthToken?.accessToken ?? "")
                    if let platformAccessToken = self.platformAccessToken,
                       let platform = self.platform {
                        let param = LoginRequestDto(platformAccessToken: platformAccessToken, platform: platform)
                        LoginService.shared.postSocialLogin(param: param) { _ in
                            setSocialType(socialType: SocialType.kakao)
                            if isFirstTime() {
                                RootViewControllerSwithcer.shared.changeRootViewController(navigationMode: .onboarding)
                            } else {
                                RootViewControllerSwithcer.shared.changeRootViewController(navigationMode: .home)
                            }
                        }
                    }
                }
            }
        } else {
            UserApi.shared.loginWithKakaoAccount {(oauthToken, error) in
                if let error = error {
                    print(error)
                } else {
                    print("login With Kakao Account success")
                    print("👍platformAccessToken", oauthToken?.accessToken ?? "")
                    self.platformAccessToken = oauthToken?.accessToken ?? ""
                    if let platformAccessToken = self.platformAccessToken,
                       let platform = self.platform {
                        let param = LoginRequestDto(platformAccessToken: platformAccessToken, platform: platform)
                        LoginService.shared.postSocialLogin(param: param) { _ in
                            setSocialType(socialType: SocialType.kakao)
                            if isFirstTime() {
                                RootViewControllerSwithcer.shared.changeRootViewController(navigationMode: .onboarding)
                            } else {
                                RootViewControllerSwithcer.shared.changeRootViewController(navigationMode: .login)
                            }
                        }
                    }
                }
            }
            if isFirstTime() {
                RootViewControllerSwithcer.shared.changeRootViewController(navigationMode: .onboarding)
            } else {
                RootViewControllerSwithcer.shared.changeRootViewController(navigationMode: .login)
            }
        }
    }
    
    @objc
    private func tapKakaoLoginButton() {
        kakaoTalkLogin()
    }
}
