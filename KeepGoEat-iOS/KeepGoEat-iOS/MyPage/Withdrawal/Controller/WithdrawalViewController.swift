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
        var data: [String] = []
        [withdrawalView.stopEatButton,
         withdrawalView.notUseCheckBox,
         withdrawalView.errorCheckBox,
         withdrawalView.badContentsCheckBox].forEach {
            if $0.isChecked == true {
                data.append($0.label.text!)
            }
        }
        if withdrawalView.manualInputCheckBox.isChecked == true {
            data.append("직접입력: " + withdrawalView.subjectiveText)
        }
        self.trackEvent(eventGroup: .deleteAccount, gesture: .completed, eventProperty: .deleteReason, data: data)
        
        guard let socialType = getSocialType() else { return }
        if socialType == SocialType.kakao.rawValue {
            deleteSocialType()
            LoginService.shared.withdraw(code: nil) { _ in
                UserApi.shared.unlink {(error) in
                    if let error = error {
                        print(error)
                    } else {
                        print("unlink() success.")
                        KeychainHandler.shared.removeAll()
                        RootViewControllerSwithcer.shared.changeRootViewController(navigationMode: .login)
                    }
                }
            }
        }
        if socialType == SocialType.apple.rawValue {
            deleteSocialType()
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
            let code = (String(data: appleIDCredential.authorizationCode!, encoding: .utf8) ?? "") as String
//            print("🚀\(code)")
            LoginService.shared.withdraw(code: code) { _ in
                KeychainHandler.shared.removeAll()
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
