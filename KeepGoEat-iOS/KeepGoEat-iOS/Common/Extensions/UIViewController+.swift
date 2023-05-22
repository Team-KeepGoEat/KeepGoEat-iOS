//
//  UIViewController+.swift
//  KeepGoEat-iOS
//
//  Created by 양정연 on 2022/12/27.
//

import Foundation
import SwiftUI

import Mixpanel

/// SwiftUI를 이용한 프리뷰 표시
extension UIViewController {
    #if DEBUG
    private struct Preview: UIViewControllerRepresentable {
            let viewController: UIViewController

            func makeUIViewController(context: Context) -> UIViewController {
                return viewController
            }

            func updateUIViewController(_ uiViewController: UIViewController, context: Context) {
            }
    }

    func toPreview() -> some View {
        Preview(viewController: self)
    }
    #endif
    
    func showBottomSheet(bottomSheetView: UIView, dimmedView: UIView) {
        bottomSheetView.snp.updateConstraints {
            $0.top.equalToSuperview().inset(UIScreen.main.bounds.size.height - 325.adjusted)
        }
        
        dimmedView.isHidden = false
        
        UIView.animate(withDuration: 0.2, delay: 0, options: .curveEaseInOut, animations: {
            self.view.layoutIfNeeded()
        }, completion: nil)
    }
    
    func hideBottomSheet(bottomSheetView: UIView, dimmedView: UIView) {
        bottomSheetView.snp.updateConstraints {
            $0.top.equalTo(UIScreen.main.bounds.size.height)
        }
        
        dimmedView.isHidden = true
        
        UIView.animate(withDuration: 0.2, delay: 0, options: .curveEaseInOut, animations: {
            self.view.layoutIfNeeded()
        }, completion: nil)
    }
    
    func makeToast(_ message: String, withDuration: Double, delay: Double) {
        let labelLength: CGFloat = (message as NSString).size(withAttributes: [NSAttributedString.Key.font: UIFont.system5]).width
        let toastLabel: UILabel = UILabel(frame: CGRect(x: UIScreen.main.bounds.width / 2 - (labelLength + 32) / 2, y: UIScreen.main.bounds.height - 88, width: labelLength + 32, height: 40)).then {
            $0.text = message
            $0.backgroundColor = .gray500
            $0.textColor = .white
            $0.font = .system5
            $0.alpha = 1.0
            $0.textAlignment = .center
            $0.layer.cornerRadius = 12
            $0.clipsToBounds = true
        }
        
        self.view.addSubview(toastLabel)
        
        UIView.animate(withDuration: withDuration, delay: delay, options: .curveEaseOut, animations: {
            toastLabel.alpha = 0.0
        }, completion: {(_) in
            toastLabel.removeFromSuperview()
        })
    }
}

/// Mixpanel
extension UIViewController {
    func setUserInMixpanel(type: LoginType) {
        let mixpanel = Mixpanel.mainInstance()
        var email: String = getEmail()
        var name: String = getUsername()
        
        if email.isEmpty {
            email = "unknown@apple.com"
        }
        if name.isEmpty {
            name = "익명의 킵고이터"
        }
        
        switch type {
        case .join:
            mixpanel.createAlias("\(email)_alias", distinctId: "Apple \(email)")
            mixpanel.people.set(properties: [
                "$name": name,
                "$email": email
            ])
            trackEvent(eventGroup: .signUp, gesture: .completed, eventProperty: nil, data: nil)
        case .login:
            mixpanel.identify(distinctId: email)
        }
    }
    
    /// Mixpanel 이벤트 추적 함수
    /// - Parameters:
    ///   - eventGroup: enum중 해당하는 Event Name 선택
    ///   - gesture: Event Definition을 보고 click, view, complete 중 선택
    ///   - eventProperty: 가변하는 데이터를 함께 전달할 때, enum 중, 해당 데이터에 대한 내용 선택
    ///   - data: eventProperty가 존재할 때, 해당하는 데이터 [String] 타입으로 작성
    func trackEvent(eventGroup: EventGroup, gesture: UserGesture, eventProperty: EventProperty?, data: [String]?) {
        let mixpanel = Mixpanel.mainInstance()
        let eventName = "\(eventGroup.rawValue) : \(gesture.rawValue)"
        
        if let propertyType = eventProperty, let data = data {
            trackEventProperty(eventName: eventName, type: propertyType, data: data)
        } else {
            mixpanel.track(event: eventName)
        }
    }
    
    func trackEventProperty(eventName: String, type: EventProperty, data: [String]) {
        let mixpanel = Mixpanel.mainInstance()
        var propertyValue: Any?
        if data.count == 1 {
            propertyValue = data.first
        } else {
            propertyValue = data
        }
        mixpanel.track(event: eventName, properties: [type.rawValue: propertyValue])
    }
}

enum LoginType {
    case join, login
}

enum EventGroup: String {
    case signUp = "Sign Up"
    case login = "Login"
    case addGoal = "Add Goal"
    case createGoal = "Create Goal"
    case completeGoal = "Complete Goal"
    case archive = "Archive"
    case deleteAccount = "Delete Account"
}

enum UserGesture: String {
    case clicked = "Clicked"
    case completed = "Completed"
    case viewed = "Viewed"
}

enum EventProperty: String {
    case goalType = "추가하려는 목표 종류"
    case goal = "목표 내용"
    case deleteReason = "탈퇴 사유"
}
