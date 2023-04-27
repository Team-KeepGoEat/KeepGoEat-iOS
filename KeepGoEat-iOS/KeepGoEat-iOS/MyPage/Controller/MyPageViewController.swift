//
//  MyPageViewController.swift
//  KeepGoEat-iOS
//
//  Created by 정채은 on 2023/03/03.
//

import UIKit

import MessageUI
import SnapKit
import Then
import WebKit

class MyPageViewController: BaseViewController {
    
    private var myPageView = MyPageView()
    
    // MARK: LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setDelegate()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        getMyPage()
        navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    override func loadView() {
        super.loadView()
        self.view = myPageView
    }
    
    private func setDelegate() {
        myPageView.handleAccountButtonDelegate = self
        myPageView.handleStoreGoalButtonDelegate = self
        myPageView.handleServiceIntroButtonDelegate = self
        myPageView.handleContactButtonDelegate = self
        myPageView.handleReviewButtonDelegate = self
        myPageView.handleServiceTermsButtonDelegate = self
        myPageView.handlePrivacyButtonDelegate = self
        myPageView.headerView.handleBackButtonDelegate = self
    }
    
    private func getMyPage() {
        MyPageService.shared.getMyPage { data in
            guard let data = data else { return }
            self.myPageView.emailLabel.text = String(data.email)
            self.myPageView.accountButton.setTitle(String(data.name), for: .normal)
            self.myPageView.storeGoalCount.text = String(data.keptGoalsCount)
        }
    }
}

extension MyPageViewController: HandleAccountButtonDelegate {
    func pushAccountInfo() {
        self.navigationController?.pushViewController(AccountInfoViewController(), animated: true)
    }
}

extension MyPageViewController: HandleBackButtonDelegate {
    func popView() {
        self.navigationController?.popViewController(animated: true)
    }
}

extension MyPageViewController: HandleStoreGoalButtonDelegate {
    func pushStoreGoal() {
        self.navigationController?.pushViewController(StoreGoalViewController(), animated: true)
    }
}

extension MyPageViewController: HandleContactButtonDelegate, MFMailComposeViewControllerDelegate {
    func sendMail() {
        if MFMailComposeViewController.canSendMail() {
                   
                   let composeViewController = MFMailComposeViewController()
            composeViewController.mailComposeDelegate = self
            
            let bodyString = """
                         Device : \(self.getDeviceIdentifier())
                         App version : \(self.getCurrentVersion())
                         OS Version : \(UIDevice.current.systemVersion)
                         -------------
                         내용 :
                         
                         """
                   
            composeViewController.setToRecipients(["Keepgo2at@gmail.com"])
            composeViewController.setSubject("킵고잇 문의사항")
            composeViewController.setMessageBody(bodyString, isHTML: false)
            self.present(composeViewController, animated: true, completion: nil)
        } else {
            self.showSendMailErrorAlert()
        }
    }
    
    func showSendMailErrorAlert() {
            let sendMailErrorAlert = UIAlertController(title: "메일 전송 실패", message: "아이폰 이메일 설정을 확인하고 다시 시도해주세요.", preferredStyle: .alert)
            let confirmAction = UIAlertAction(title: "확인", style: .default) { (action) in
            }
            sendMailErrorAlert.addAction(confirmAction)
            self.present(sendMailErrorAlert, animated: true, completion: nil)
        }

    func getDeviceIdentifier() -> String {
        var systemInfo = utsname()
        uname(&systemInfo)
        let machineMirror = Mirror(reflecting: systemInfo.machine)
        let identifier = machineMirror.children.reduce("") { identifier, element in
            guard let value = element.value as? Int8, value != 0 else { return identifier }
            return identifier + String(UnicodeScalar(UInt8(value)))
        }
        return identifier
    }
    func getCurrentVersion() -> String {
        guard let dictionary = Bundle.main.infoDictionary,
              let version = dictionary["CFBundleShortVersionString"] as? String else { return "" }
        return version
    }
    func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
        // ✅ MFMailComposeResult 가지고 메일 작성 인터페이스가 닫힐때의 결과에 대응할 수있다.
        switch result {
        case .cancelled:
            // ✅ The user canceled the operation.
            print("cancelled")
        case .saved:
            // ✅ The email message was saved in the user’s drafts folder.
            print("saved")
        case .sent:
            // ✅ The email message was queued in the user’s outbox.
            print("sent")
        case .failed:
            // ✅ The email message was not saved or queued, possibly due to an error.
            print("failed")
        }
        // ✅ Dismiss the mail compose view controller.
        controller.dismiss(animated: true, completion: nil)
    }
}

extension MyPageViewController: HandleServiceIntroButtonDelegate {
    func pushServiceIntro() {
        self.navigationController?.pushViewController(ServiceIntroViewController(), animated: true)
    }
}

extension MyPageViewController: HandleReviewButtonDelegate {
    func requestReview() {
        // 앱스토어 아이디 나오면 뒤에 추가 예정 /app/id{앱스토어ID}
        if let appstoreUrl = URL(string: "https://apps.apple.com") {
            var urlComponents = URLComponents(url: appstoreUrl, resolvingAgainstBaseURL: false)
            urlComponents?.queryItems = [
                URLQueryItem(name: "action", value: "write-review")
            ]
            guard let reviewUrl = urlComponents?.url else {
                return
            }
            UIApplication.shared.open(reviewUrl, options: [:], completionHandler: nil)
        }
    }
}

extension MyPageViewController: HandleServiceTermsButtonDelegate, HandlePrivacyButtonDelegate, WKNavigationDelegate {
    func openServiceTermsWebView() {
        let url = URL(string: "https://68space.notion.site/7d49b1a8912440cb9ec262392e5583e2")!
        UIApplication.shared.open(url, options: [:], completionHandler: nil)
    }
    func openPrivacyWebView() {
        let url = URL(string: "https://68space.notion.site/9083a018baab42958103596378417c13")!
        UIApplication.shared.open(url, options: [:], completionHandler: nil)
    }
}
