//
//  WithdrawalViewController.swift
//  KeepGoEat-iOS
//
//  Created by 정채은 on 2023/03/08.
//

import AuthenticationServices
import UIKit

import KakaoSDKUser
import SnapKit
import Then

class WithdrawalViewController: BaseViewController {
    
    private var withdrawalView = WithdrawalView()
    
    // MARK: LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setDelegate()
    }
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    override func loadView() {
        super.loadView()
        self.view = withdrawalView

    }
    
    private func setDelegate() {
        withdrawalView.headerView.handleBackButtonDelegate = self
        withdrawalView.withdrawalAlertView.handleWithdrawAlertButtonDelegate = self
    }
}

extension WithdrawalViewController: HandleBackButtonDelegate {
    func popView() {
        self.navigationController?.popViewController(animated: true)
    }
}

extension WithdrawalViewController: HandleWithdrawAlertButtonDelegate {
    func withdrawOkButtonDidTap() {
        let socialType: SocialType = getSocialType()
        switch socialType {
        case .kakao:
            LoginService.shared.withdraw(code: nil) { message in
                UserApi.shared.unlink {(error) in
                    if let error = error {
                        print(error)
                    }
                    else {
                        print("unlink() success.")
                        deleteUserTokenOnKeyChain(tokenName: Const.String.userAccessToken)
                        deleteUserTokenOnKeyChain(tokenName: Const.String.userRefreshToken)
                        deleteSocialType()
                        RootViewControllerSwithcer.shared.changeRootViewController(navigationMode: .login)
                    }
                }
            }
        case .apple:
            let appleIDProvider = ASAuthorizationAppleIDProvider()
            let request = appleIDProvider.createRequest()
            request.requestedScopes = [.fullName, .email]
            let authorizationController = ASAuthorizationController(authorizationRequests: [request])
            authorizationController.delegate = self
            authorizationController.presentationContextProvider = self
            authorizationController.performRequests()
        }
    }
}

extension WithdrawalViewController: ASAuthorizationControllerDelegate, ASAuthorizationControllerPresentationContextProviding {
    func presentationAnchor(for controller: ASAuthorizationController) -> ASPresentationAnchor {
        return self.view.window!
    }
    
    func authorizationController(controller: ASAuthorizationController, didCompleteWithAuthorization authorization: ASAuthorization) {
        switch authorization.credential {
        case let appleIDCredential as ASAuthorizationAppleIDCredential:
            let platformAccessToken = String(data: appleIDCredential.identityToken!, encoding: .utf8) ?? ""
            LoginService.shared.withdraw(code: String(data: appleIDCredential.authorizationCode!, encoding: .utf8)) { message in
                deleteUserTokenOnKeyChain(tokenName: Const.String.userAccessToken)
                deleteUserTokenOnKeyChain(tokenName: Const.String.userRefreshToken)
                deleteSocialType()
                RootViewControllerSwithcer.shared.changeRootViewController(navigationMode: .login)
            }
        default:
            break
        }
    }
    
    func authorizationController(controller: ASAuthorizationController, didCompleteWithError error: Error) {
        print("🍎 Apple Login 연동 실패")
    }
}
