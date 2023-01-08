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

class HomeAchieveButton: UIButton {
    // MARK: - Variables
    private var config = UIButton.Configuration.plain()
    
    var isAchievedMore: Bool = false {
        didSet {
            isAchievedMore ? achievedMore() : yetMore()
        }
    }
    var isAchievedLess: Bool = false {
        didSet {
            isAchievedLess ? achievedLess() : yetLess()
        }
    }
    
    // MARK: Component
    
    // MARK: - Function
    // MARK: LifeCycle
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setLayout()
        setUI()
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
    func setUI() {
        config.imagePadding = 8
        config.imagePlacement = .leading
        config.baseForegroundColor = .gray50
        config.image = Const.Image.icnCheck
        config.background.backgroundColor = .green600
        config.attributedTitle = AttributedString(Const.String.homeLessButtonBefore, attributes: AttributeContainer([NSAttributedString.Key.font: UIFont.system4Bold]))
        self.configuration = config
    }
    private func yetMore() {
        config.baseForegroundColor = .gray50
        config.image = Const.Image.icnCheck
        config.background.backgroundColor = .orange600
        config.attributedTitle = AttributedString(Const.String.homeMoreButtonBefore, attributes: AttributeContainer([NSAttributedString.Key.font: UIFont.system4Bold]))
        self.configuration = config
    }
    private func achievedMore() {
        config.image = Const.Image.icnCheckOrange
        config.baseForegroundColor = .orange600
        config.background.backgroundColor = .orange50
        config.attributedTitle = AttributedString(Const.String.homeMoreButtonAfter, attributes: AttributeContainer([NSAttributedString.Key.font: UIFont.system4Bold]))
        self.configuration = config
    }
    private func yetLess() {
        config.baseForegroundColor = .gray50
        config.image = Const.Image.icnCheck
        config.background.backgroundColor = .green600
        config.attributedTitle = AttributedString(Const.String.homeLessButtonBefore, attributes: AttributeContainer([NSAttributedString.Key.font: UIFont.system4Bold]))
        self.configuration = config
    }
    private func achievedLess() {
        config.image = Const.Image.icnCheckGreen
        config.baseForegroundColor = .green600
        config.background.backgroundColor = .green100
        config.attributedTitle = AttributedString(Const.String.homeLessButtonAfter, attributes: AttributeContainer([NSAttributedString.Key.font: UIFont.system4Bold]))
        self.configuration = config
    }
}
