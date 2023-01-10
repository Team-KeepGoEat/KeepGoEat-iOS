//
//  HomeNewGoalTypeView.swift
//  KeepGoEat-iOS
//
//  Created by 양정연 on 2023/01/10.
//

import UIKit

class HomeNewGoalTypeView: UIView {

    // MARK: - Variables
    private let eatType: EatType
    
    // MARK: Component
    private let titleLabel = UILabel().then {
        $0.font = .system3Bold
    }
    private let subLabel = UILabel().then {
        $0.font = .system5
        $0.textColor = .gray600
    }
    private let snailImage = UIImageView()

}
