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
        var email: String? = getEmail()
        var name: String? = getUsername()
        
        if email == "" || email == nil {
            email = getSocialType() == SocialType.kakao.rawValue ? "unknown@kakao.com" : "unknown@apple.com"
        }
        if name == "" || name == nil {
            name = "킵고이터"
        }
        
        switch type {
        case .join:
            mixpanel.createAlias("\(email ?? "")_alias", distinctId: String(email!))
            mixpanel.people.set(properties: [
                "$name": name,
                "$email": email
            ])
            trackEvent(eventGroup: .account, gesture: .completed, event: "회원가입", eventProperty: nil, data: nil)
        case .login:
            mixpanel.identify(distinctId: String(email!))
        }
    }
    
    func setUserPropertyInMixpanel(type: UserPropertyType,
                                   agree: Bool?, count: Int?,
                                   platformTagRequestType: PlatformTagRequestType?) {
        let mixpanel = Mixpanel.mainInstance()
        
        switch type {
        case .systemPushState, .marketingInfoAlertState:
            mixpanel.people.set(property: type.rawValue, to: agree)
        case .platformTagNumber:
            switch platformTagRequestType {
            case .set:
                mixpanel.people.set(property: type.rawValue, to: count)
            case .add:
                mixpanel.people.increment(property: type.rawValue, by: 1)
            case .delete:
                mixpanel.people.increment(property: type.rawValue, by: -1)
            case .none:
                break
            }
        case .savePhotoNumber, .photoAlertNumber, .searchNumber:
            mixpanel.people.increment(property: type.rawValue, by: 1)
        }
    }
    
    func trackEvent(eventGroup: EventGroup, gesture: UserGesture, event: String, eventProperty: EventProperty?, data: [String]?) {
        let mixpanel = Mixpanel.mainInstance()
        let eventName = "\(eventGroup.rawValue)_\(event) \(gesture.rawValue)"
        
        if let propertyType = eventProperty, let data = data {
            trackEventProperty(eventName: eventName, type: propertyType, data: data)
        } else {
            mixpanel.track(event: eventName)
        }
    }
    
    func trackEventProperty(eventName: String, type: EventProperty, data: [String]) {
        let mixpanel = Mixpanel.mainInstance()
        var propertyValue: Any? = nil
        if data.count == 1 {
            propertyValue = data.first
        } else {
            propertyValue = data
        }
        mixpanel.track(event: eventName,
                       properties: [
                            type.rawValue : propertyValue
                       ])
    }
}

enum LoginType {
    case join, login
}

enum UserPropertyType: String {
    case systemPushState = "State of 시스템 푸시 동의"
    case marketingInfoAlertState = "State of 마케팅 정보 알림 동의"
    case savePhotoNumber = "Total number of 사진 저장"
    case photoAlertNumber = "Total number of 알림 설정"
    case platformTagNumber = "Total number of 플랫폼 유형"
    case searchNumber = "Total number of 검색어"
}

enum PlatformTagRequestType {
    case add, delete, set
}

enum EventGroup: String {
    case push = "푸시"
    case account = "계정관리"
    case onboarding = "온보딩"
    case searchTab = "검색탭"
    case share = "공유"
    case singlePicture = "개별사진"
    case multiplePicture = "다중사진"
    case tagTab = "태그탭"
    case sideMenu = "반시트"
    case alarmTab = "알림탭"
    case setting = "환경설정"
    
}

enum UserGesture: String {
    case clicked = "Clicked"
    case completed = "Completed"
    case viewed = "Viewed"
}

enum EventProperty: String {
    case initSavedTag = "초기입력 태그명"
    case editNormalTag = "중도편집 태그명"
    case editPlatform = "플랫폼유형 태그명"
}
