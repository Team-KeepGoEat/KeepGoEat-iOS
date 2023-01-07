//
//  StoreFilterButton.swift
//  KeepGoEat-iOS
//
//  Created by 양정연 on 2023/01/08.
//

import UIKit

enum SelectType: String {
    case seleted
    case unselected
}

class StoreFilterButton: UIButton {

    private let selectType: SelectType
    
    init(frame: CGRect, title: String, selectType: SelectType) {
        self.selectType = selectType
        super.init(frame: frame)
        
        setUI(title: title, selectType: selectType)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setUI(title: String, selectType: SelectType) {
        var config = UIButton.Configuration.plain()
        config.background.backgroundColor = .gray50
        config.contentInsets = NSDirectionalEdgeInsets(top: 2, leading: 5, bottom: 2, trailing: 5)
        switch selectType {
        case .seleted:
            config.baseForegroundColor = .gray800
            config.attributedTitle = AttributedString(title, attributes: AttributeContainer([NSAttributedString.Key.font: UIFont.system5Bold]))
        case .unselected:
            config.baseForegroundColor = .gray400
            config.attributedTitle = AttributedString(title, attributes: AttributeContainer([NSAttributedString.Key.font: UIFont.system5]))
        }
        self.configuration = config
    }
}
