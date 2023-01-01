//
//  SocialLoginButtonView.swift
//  KeepGoEat-iOS
//
//  Created by 이승헌 on 2023/01/01.
//

import UIKit

import Then
import SnapKit

enum SocialType: String {
    case KAKAO
    case APPLE
}

class SocialLoginButton: UIButton {
    
    // MARK: - Variables
    private let socialType: SocialType
    
    // MARK: Component
    private let socialLogo: UIImageView = UIImageView()
    
    private let socialLabel: UILabel = UILabel().then {
        $0.font = .system4Bold
    }
    
    init(frame: CGRect, socialType: SocialType) {
        self.socialType = socialType
        super.init(frame: frame)
        setUI()
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension SocialLoginButton {
    private func setUI() {
        self.layer.cornerRadius = 6
        switch socialType {
        case .APPLE:
            print("Error")
        case .KAKAO:
            self.backgroundColor = UIColor(named: "kakao")
            socialLogo.image = UIImage(named: "kakaoLogo")
            socialLabel.text = Const.String.kakaoLogin
        }
    }
    
    private func setLayout() {
        self.addSubviews(
            socialLogo,
            socialLabel
        )
        
        self.snp.makeConstraints {
            $0.height.equalTo(48)
        }
        
        socialLogo.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.leading.equalToSuperview().inset(20)
        }
        
        socialLabel.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.centerX.equalToSuperview()
        }
    }
}
