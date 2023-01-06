//
//  HomeAchieveButton.swift
//  KeepGoEat-iOS
//
//  Created by 양정연 on 2023/01/07.
//

import UIKit

import SnapKit

class HomeAchieveButton: UIButton {
    // MARK: - Variables
    private let kindType: KindType
    private let stateType: StateType
    
    // MARK: Component
    
    // MARK: - Function
    // MARK: LifeCycle
    init(frame: CGRect) {
        super.init(frame: frame)
        
        setLayout()
        setUI(kindType: .more, stateType: .after)
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: Layout Helpers
    private func setLayout() {
        self.snp.makeConstraints {
            $0.edges.equalToSuperview().inset(-16)
        }
    }
    private func setUI(kindType: KindType, stateType: StateType) {
        var config = UIButton.Configuration.plain()
        config.imagePadding = 8
        config.imagePlacement = .leading
        switch stateType {
        case .before:
            config.baseForegroundColor = .gray50
            config.image = Const.Image.icnCheck
            switch kindType {
            case .less:
                config.background.backgroundColor = .green600
                config.attributedTitle = AttributedString(Const.String.homeAddGoal, attributes: AttributeContainer([NSAttributedString.Key.font: UIFont.system4Bold]))
            case .more:
                config.background.backgroundColor = .orange600
                config.attributedTitle = AttributedString(Const.String.homeAddGoal, attributes: AttributeContainer([NSAttributedString.Key.font: UIFont.system4Bold]))
            }
        case .after:
            switch kindType {
            case .less:
                config.image = Const.Image.icnCheckGreen
                config.baseForegroundColor = .green600
                config.background.backgroundColor = .orange50
                config.attributedTitle = AttributedString(Const.String.homeAddGoal, attributes: AttributeContainer([NSAttributedString.Key.font: UIFont.system4Bold]))
            case .more:
                config.image = Const.Image.icnCheckOrange
                config.baseForegroundColor = .orange600
                config.background.backgroundColor = .green50
                config.attributedTitle = AttributedString(Const.String.homeAddGoal, attributes: AttributeContainer([NSAttributedString.Key.font: UIFont.system4Bold]))
            }
        }
        self.configuration = config
    }
}
