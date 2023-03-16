////
////  ContactViewController.swift
////  KeepGoEat-iOS
////
////  Created by 정채은 on 2023/03/16.
////
//
//import UIKit
//import MessageUI
//
//class ContactViewController: UIViewController, MFMailComposeViewControllerDelegate {
//    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//    }
//    
//    func showSendMailErrorAlert() {
//        let sendMailErrorAlert = UIAlertController(title: "메일을 전송 실패", message: "아이폰 이메일 설정을 확인하고 다시 시도해주세요.", preferredStyle: .alert)
//        let confirmAction = UIAlertAction(title: "확인", style: .default) {
//            (action) in
//            print("확인")
//        }
//        sendMailErrorAlert.addAction(confirmAction)
//        self.present(sendMailErrorAlert, animated: true, completion: nil)
//    }
//    
//    @IBAction func commentsButtonTapped(_ sender: UIButton) {
//        if MFMailComposeViewController.canSendMail() {
//            let composeViewController = MFMailComposeViewController()
//            composeViewController.mailComposeDelegate = self
//            
//            let bodyString = """
//                             이곳에 내용을 작성해주세요.
//                             
//                             오타 발견 문의 시 아래 양식에 맞춰 작성해주세요.
//                             
//                             <예시>
//                             글귀 ID : 글귀 4 (글귀 클릭 시 상단에 표시)
//                             수정 전 : 실수해도 되.
//                             수정 후 : 실수해도 돼.
//                             
//                             -------------------
//                             
//                             Device Model : \(self.getDeviceIdentifier())
//                             Device OS : \(UIDevice.current.systemVersion)
//                             App Version : \(self.getCurrentVersion())
//                             
//                             -------------------
//                             """
//            
//            composeViewController.setToRecipients(["modakyi.help@gmail.com"])
//            composeViewController.setSubject("<모닥이> 문의 및 의견")
//            composeViewController.setMessageBody(bodyString, isHTML: false)
//            
//            self.present(composeViewController, animated: true, completion: nil)
//        } else {
//            print("메일 보내기 실패")
//            let sendMailErrorAlert = UIAlertController(title: "메일 전송 실패", message: "메일을 보내려면 'Mail' 앱이 필요합니다. App Store에서 해당 앱을 복원하거나 이메일 설정을 확인하고 다시 시도해주세요.", preferredStyle: .alert)
//            let goAppStoreAction = UIAlertAction(title: "App Store로 이동하기", style: .default) { _ in
//                // 앱스토어로 이동하기(Mail)
//                if let url = URL(string: "https://apps.apple.com/kr/app/mail/id1108187098"), UIApplication.shared.canOpenURL(url) {
//                    if #available(iOS 10.0, *) {
//                        UIApplication.shared.open(url, options: [:], completionHandler: nil)
//                    } else {
//                        UIApplication.shared.openURL(url)
//                    }
//                }
//            }
//            let cancleAction = UIAlertAction(title: "취소", style: .destructive, handler: nil)
//            
//            sendMailErrorAlert.addAction(goAppStoreAction)
//            sendMailErrorAlert.addAction(cancleAction)
//            self.present(sendMailErrorAlert, animated: true, completion: nil)
//        }
//    }
//    
//    func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
//        controller.dismiss(animated: true, completion: nil)
//    }
//    // Device Identifier 찾기
//    func getDeviceIdentifier() -> String {
//        var systemInfo = utsname()
//        uname(&systemInfo)
//        let machineMirror = Mirror(reflecting: systemInfo.machine)
//        let identifier = machineMirror.children.reduce("") { identifier, element in
//            guard let value = element.value as? Int8, value != 0 else { return identifier }
//            return identifier + String(UnicodeScalar(UInt8(value)))
//        }
//        
//        return identifier
//    }
//
//    // 현재 버전 가져오기
//    func getCurrentVersion() -> String {
//        guard let dictionary = Bundle.main.infoDictionary,
//              let version = dictionary["CFBundleShortVersionString"] as? String else { return "" }
//        return version
//    }
//    
//}
//
//
//extension ContactViewController: MFMailComposeViewControllerDelegate {
//    func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
//        self.dismiss(animated: true, completion: nil)
//    }
//}
