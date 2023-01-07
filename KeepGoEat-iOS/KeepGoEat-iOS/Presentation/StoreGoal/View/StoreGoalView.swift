//
//  StoreGoalView.swift
//  KeepGoEat-iOS
//
//  Created by 양정연 on 2023/01/08.
//

import UIKit

import SnapKit
import Then

class StoreGoalView: UIView {

    // MARK: Component
    private let headerView = HeaderView()
    private let headerLabel = UILabel().then {
        $0.font = .system4Bold
        $0.textColor = .gray800
        $0.text = Const.String.storeTitle
    }
    private let totalButton = UIButton().then {
        var config = UIButton.Configuration.plain()
        config.background.backgroundColor = .gray50
        config.attributedTitle = AttributedString(Const.String.storeFilterAll, attributes: AttributeContainer([NSAttributedString.Key.font: UIFont.system5]))
        config.baseForegroundColor = .gray800
        config.contentInsets = NSDirectionalEdgeInsets(top: 2, leading: 5, bottom: 2, trailing: 5)
        $0.configuration = config
    }
    private let moreButton = UIButton().then {
        var config = UIButton.Configuration.plain()
        config.background.backgroundColor = .gray50
        config.attributedTitle = AttributedString(Const.String.storeFilterMore, attributes: AttributeContainer([NSAttributedString.Key.font: UIFont.system5]))
        config.baseForegroundColor = .gray800
        config.contentInsets = NSDirectionalEdgeInsets(top: 2, leading: 5, bottom: 2, trailing: 5)
        $0.configuration = config
    }
    private let lessButton = UIButton().then {
        var config = UIButton.Configuration.plain()
        config.background.backgroundColor = .gray50
        config.attributedTitle = AttributedString(Const.String.storeFilterLess, attributes: AttributeContainer([NSAttributedString.Key.font: UIFont.system5]))
        config.baseForegroundColor = .gray800
        config.contentInsets = NSDirectionalEdgeInsets(top: 2, leading: 5, bottom: 2, trailing: 5)
        $0.configuration = config
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUI()
        setLayout()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setUI() {
        self.backgroundColor = .gray50
    }
    private func setLayout() {
        self.addSubviews(
            headerView,
            headerLabel,
            lessButton,
            moreButton,
            totalButton
        )
        
        headerView.snp.makeConstraints {
            $0.top.equalTo(self.safeAreaLayoutGuide)
        }
        headerLabel.snp.makeConstraints {
            $0.top.equalTo(headerView.snp.bottom).offset(24.adjusted)
            $0.leading.equalToSuperview().offset(16.adjusted)
        }
        lessButton.snp.makeConstraints {
            $0.top.equalTo(headerView.snp.bottom).offset(24)
            $0.trailing.equalToSuperview().offset(-11.adjusted)
        }
        moreButton.snp.makeConstraints {
            $0.top.equalTo(headerView.snp.bottom).offset(24)
            $0.trailing.equalTo(lessButton.snp.leading).offset(-7.adjusted)
        }
        totalButton.snp.makeConstraints {
            $0.top.equalTo(headerView.snp.bottom).offset(24)
            $0.trailing.equalTo(moreButton.snp.leading).offset(-7.adjusted)
        }
    }
}
