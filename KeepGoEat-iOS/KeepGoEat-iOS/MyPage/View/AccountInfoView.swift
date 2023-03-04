//
//  AccountInfoView.swift
//  KeepGoEat-iOS
//
//  Created by 정채은 on 2023/02/24.
//

import UIKit

import Then
import SnapKit

class AccountInfoView: UIView {
    
    // MARK: Component
    
    private let headerView: HeaderView = HeaderView()
    
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
    
    // MARK: LifeCycle
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUI()
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension AccountInfoView {
    
    private func setUI() {
        self.backgroundColor = .white
    }
    private func setLayout() {
        self.addSubviews(
        headerView,
        accountLabel,
        emailLabel,
        lineView,
        logoutButton,
        withdrawalButton
        )
        
        headerView.addSubviews(
            headerViewTitle
        )
        
        headerView.snp.makeConstraints{
            $0.top.equalTo(self.safeAreaLayoutGuide)
            $0.horizontalEdges.equalTo(self.safeAreaLayoutGuide)
            $0.height.equalTo(48.adjusted)
        }
        
        headerViewTitle.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.centerX.equalToSuperview()
        }
        
        accountLabel.snp.makeConstraints{
            $0.top.equalTo(headerView.snp.bottom).offset(24.adjusted)
            $0.leading.equalToSuperview().inset(16.adjusted)
        }
        
        emailLabel.snp.makeConstraints{
            $0.top.equalTo(accountLabel.snp.bottom).offset(4.adjusted)
            $0.leading.equalToSuperview().inset(16.adjusted)
        }
        
        lineView.snp.makeConstraints{
            $0.top.equalTo(emailLabel.snp.bottom).offset(20.adjusted)
            $0.height.equalTo(2)
            $0.width.equalToSuperview()
        }
        
        logoutButton.snp.makeConstraints{
            $0.top.equalTo(lineView.snp.bottom).offset(20.adjusted)
            $0.leading.equalToSuperview().inset(16.adjusted)
        }
        
        withdrawalButton.snp.makeConstraints{
            $0.top.equalTo(logoutButton.snp.bottom).offset(16.adjusted)
            $0.leading.equalToSuperview().inset(16.adjusted)
        }
    }
}
