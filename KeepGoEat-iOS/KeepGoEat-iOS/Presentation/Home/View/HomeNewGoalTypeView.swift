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
    
    init(frame: CGRect, eatType: EatType) {
        self.eatType = eatType
        super.init(frame: frame)
        
        setUI(eatType: eatType)
        setAddTarget(eatType: eatType)
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setUI(eatType: EatType) {
        switch eatType {
        case .more:
            titleLabel.text = Const.String.moreEat
            titleLabel.textColor = .orange600
            subLabel.text = Const.String.homeNewBottomSubMore
            snailImage.image = Const.Image.snailOrangeSpoon
        case .less:
            titleLabel.text = Const.String.lessEat
            titleLabel.textColor = .green600
            subLabel.text = Const.String.homeNewBottomSubLess
            snailImage.image = Const.Image.snailGreenRibon
        }
    }
    private func setAddTarget(eatType: EatType) {
        switch eatType {
        case .more:
            // TODO: addTarget 함수 연결
            print("더 먹기")
        case .less:
            // TODO: addTarget 함수 연결
            print("덜 먹기")
        }
    }
}
