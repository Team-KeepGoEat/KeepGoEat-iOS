//
//  AccountInfoView.swift
//  KeepGoEat-iOS
//
//  Created by 정채은 on 2023/02/24.
//

// TODO: UI 뷰 짜기
import UIKit

import Then
import SnapKit

class AccountInfoView: UIView {
    
    // MARK: Component
    
    private let headerView: HeaderView = HeaderView()
    
    private let headerLabel = UILabel().then {
        $0.text = Const.String.accountInfoHeader
        $0.textColor = .gray800
        $0.font = .system4Bold
    }
    
    private let accountLabel = UILabel().then {
        $0.text = "user214"
        $0.textColor = .gray800
        $0.font = .system3Bold
    }
    
    private let emailLabel = UILabel().then {
        $0.text = "keepgoeat@kakao.com"
        $0.textColor = .gray600
        $0.font = .system5
    }
    
    private let lineView = UIView().then {
        $0.backgroundColor = .gray200
    }
    
    private let logoutButton = UIButton().then {
        $0.setTitle(Const.String.logout, for: .normal)
        $0.setTitleColor(.gray800, for: .normal)
        $0.titleLabel?.font = .system4
    }
    
    private let withdrawalButton = UIButton().then {
        $0.setTitle(Const.String.withdrawal, for: .normal)
        $0.setTitleColor(.gray800, for: .normal)
        $0.titleLabel?.font = .system4
    }
}
