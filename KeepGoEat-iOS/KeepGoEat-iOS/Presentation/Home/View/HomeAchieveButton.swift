//
//  HomeAchieveButton.swift
//  KeepGoEat-iOS
//
//  Created by 양정연 on 2023/01/07.
//

import UIKit

import SnapKit

enum KindType: String {
    case less
    case more
}
enum StateType: String {
    case before
    case after
}

class HomeAchieveButton: UIButton {
    // MARK: - Variables
    private let kindType: KindType
    private let stateType: StateType
    
    // MARK: Component
    
    // MARK: - Function
    // MARK: LifeCycle
    init(frame: CGRect, kindType: KindType = .more, stateType: StateType = .before) {
        self.kindType = kindType
        self.stateType = stateType
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
            $0.width.equalTo(311.adjustedWidth)
            $0.height.equalTo(42.adjusted)
        }
    }
    func setUI(kindType: KindType, stateType: StateType) {
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
                config.attributedTitle = AttributedString(Const.String.homeLessButtonBefore, attributes: AttributeContainer([NSAttributedString.Key.font: UIFont.system4Bold]))
            case .more:
                config.background.backgroundColor = .orange600
                config.attributedTitle = AttributedString(Const.String.homeMoreButtonBefore, attributes: AttributeContainer([NSAttributedString.Key.font: UIFont.system4Bold]))
            }
        case .after:
            switch kindType {
            case .less:
                config.image = Const.Image.icnCheckGreen
                config.baseForegroundColor = .green600
                config.background.backgroundColor = .green100
                config.attributedTitle = AttributedString(Const.String.homeLessButtonAfter, attributes: AttributeContainer([NSAttributedString.Key.font: UIFont.system4Bold]))
            case .more:
                config.image = Const.Image.icnCheckOrange
                config.baseForegroundColor = .orange600
                config.background.backgroundColor = .orange50
                config.attributedTitle = AttributedString(Const.String.homeMoreButtonAfter, attributes: AttributeContainer([NSAttributedString.Key.font: UIFont.system4Bold]))
            }
        }
        self.configuration = config
    }
}
