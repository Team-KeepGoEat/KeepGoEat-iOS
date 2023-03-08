//
//  MyPageView.swift
//  KeepGoEat-iOS
//
//  Created by 정채은 on 2023/03/08.
//

import UIKit

import Then
import SnapKit

class MyPageView: UIView {
    
    // MARK: Component
    
    let headerView: HeaderView = HeaderView()
    
    private let headerViewTitle = UILabel().then {
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
    
    
    
        
}
