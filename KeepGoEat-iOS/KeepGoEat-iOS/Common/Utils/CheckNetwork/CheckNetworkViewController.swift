//
//  CheckNetworkViewController.swift
//  KeepGoEat-iOS
//
//  Created by 양정연 on 2023/04/15.
//

import UIKit

class CheckNetworkViewController: UIViewController {
    
    let alertController = UIAlertController(
        title: "네트워크에 접속할 수 없습니다.",
        message: "네트워크 연결 상태를 확인해주세요.",
        preferredStyle: .alert
    )
    
    let endAction = UIAlertAction(title: "종료", style: .destructive) { _ in
        // 앱 종료
        UIApplication.shared.perform(#selector(NSXPCConnection.suspend))
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            exit(0)
        }
    }
    
    let confirmAction = UIAlertAction(title: "확인", style: .default) { _ in
        // 설정앱 켜주기
        guard let url = URL(string: UIApplication.openSettingsURLString) else { return }
        if UIApplication.shared.canOpenURL(url) {
            UIApplication.shared.open(url)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        presentAlert()
    }
    
    private func presentAlert() {
        alertController.addAction(endAction)
        alertController.addAction(confirmAction)
        self.present(alertController, animated: true, completion: nil)
    }
    
}
