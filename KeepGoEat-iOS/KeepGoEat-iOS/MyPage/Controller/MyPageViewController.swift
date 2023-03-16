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

class MyPageViewController: BaseViewController {
    
    private var myPageView = MyPageView()
    
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
        self.view = myPageView
    }
    
    private func setDelegate() {
        myPageView.handleAccountButtonDelegate = self
        myPageView.handleStoreGoalButtonDelegate = self
        myPageView.handleServiceIntroButtonDelegate = self
        myPageView.handleContactButtonDelegate = self
        myPageView.handleReviewButtonDelegate = self
        myPageView.headerView.handleBackButtonDelegate = self
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

extension MyPageViewController : HandleContactButtonDelegate, MFMailComposeViewControllerDelegate {
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
        }
        else {
            self.showSendMailErrorAlert()
        }
    }
    
    func showSendMailErrorAlert() {
            let sendMailErrorAlert = UIAlertController(title: "메일 전송 실패", message: "아이폰 이메일 설정을 확인하고 다시 시도해주세요.", preferredStyle: .alert)
            let confirmAction = UIAlertAction(title: "확인", style: .default) {
                (action) in
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
}

extension MyPageViewController: HandleServiceIntroButtonDelegate {
    func pushServiceIntro() {
        self.navigationController?.pushViewController(ServiceIntroViewController(), animated: true)
    }
}

extension MyPageViewController: HandleReviewButtonDelegate {
    func requestReview() {
        /// 앱스토어 아이디 나오면 뒤에 추가 예정 /app/id{앱스토어ID}
        if let appstoreUrl = URL(string: "https://apps.apple.com") {
            var urlComp = URLComponents(url: appstoreUrl, resolvingAgainstBaseURL: false)
            urlComp?.queryItems = [
                URLQueryItem(name: "action", value: "write-review")
            ]
            guard let reviewUrl = urlComp?.url else {
                return
            }
            UIApplication.shared.open(reviewUrl, options: [:], completionHandler: nil)
        }
    }
}



