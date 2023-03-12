//
//  LoginViewController.swift
//  KeepGoEat-iOS
//
//  Created by 양정연 on 2022/12/27.
//

import AuthenticationServices
import UIKit

class LoginViewController: BaseViewController {
    
    // MAKR: Variables
    var loginResponse: LoginResponseDto?
    
    // MARK: Component
    private let loginImageView: UIImageView = UIImageView().then {
        $0.image = UIImage(named: "imgSignup")
    }
    
    private let kakaoLoginButton: SocialLoginButton = SocialLoginButton(frame: CGRect(), socialType: .kakao)
    private let appleLoginButton: SocialLoginButton = SocialLoginButton(frame: CGRect(), socialType: .apple)

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
            kakaoLoginButton,
            appleLoginButton
        )
        
        loginImageView.snp.makeConstraints {
            $0.width.equalTo(360.adjusted)
            $0.height.equalTo(328.adjusted)
            $0.top.equalToSuperview().inset(144.adjusted)
        }
        
        kakaoLoginButton.snp.makeConstraints {
            $0.directionalHorizontalEdges.equalToSuperview().inset(16.adjusted)
            $0.bottom.equalToSuperview().inset(44.adjusted)
        }

        appleLoginButton.snp.makeConstraints {
            $0.horizontalEdges.equalToSuperview().inset(16.adjusted)
            $0.bottom.equalTo(kakaoLoginButton.snp.top).inset(-16.adjusted)
        }
    }
    
    private func setAddTarget() {
        appleLoginButton.addTarget(self, action: #selector(tapAppleLoginButton), for: .touchUpInside)
    }
    
    @objc
    private func tapAppleLoginButton() {
        let appleIDProvider = ASAuthorizationAppleIDProvider()
        let request = appleIDProvider.createRequest()
        request.requestedScopes = [.fullName, .email]
        let authorizationController = ASAuthorizationController(authorizationRequests: [request])
        authorizationController.delegate = self
        authorizationController.presentationContextProvider = self
        authorizationController.performRequests()
        print("appleLogin")
    }
}

extension LoginViewController: ASAuthorizationControllerDelegate, ASAuthorizationControllerPresentationContextProviding {
    func presentationAnchor(for controller: ASAuthorizationController) -> ASPresentationAnchor {
        return self.view.window!
    }
    
    func authorizationController(controller: ASAuthorizationController, didCompleteWithAuthorization authorization: ASAuthorization) {
        print("authorizationController")

        switch authorization.credential {
        case let appleIDCredential as ASAuthorizationAppleIDCredential:
            let platformAccessToken = String(data: appleIDCredential.identityToken!, encoding: .utf8) ?? ""
            let platform: String = "APPLE"
            print("🍏 Apple Login Token", platformAccessToken)
            print("🍏 authorizationCode", String(data: appleIDCredential.authorizationCode!, encoding: .utf8) ?? "")
            let param = LoginRequestDto(platformAccessToken: platformAccessToken, platform: platform)
            LoginService.shared.postSocialLogin(param: param) { _ in
                RootViewControllerSwithcer.shared.changeRootViewController(navigationMode: .onboarding)
            }
        default:
            break
        }
    }
    
    func authorizationController(controller: ASAuthorizationController, didCompleteWithError error: Error) {
        print("🍎 Apple Login 연동 실패")
    }
}
