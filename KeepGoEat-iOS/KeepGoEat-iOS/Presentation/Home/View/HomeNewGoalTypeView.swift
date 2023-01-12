//
//  HomeNewGoalTypeView.swift
//  KeepGoEat-iOS
//
//  Created by 양정연 on 2023/01/10.
//

import UIKit

protocol HandleNewGoalButtonDelegate: AnyObject {
    func pushNewGoalView(eatType: EatType)
}

class HomeNewGoalTypeView: UIView {

    // MARK: - Variables
    private let eatType: EatType
    
    weak var handleNewGoalButtonDelegate: HandleNewGoalButtonDelegate?
    
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
        setLayout()
        setAddTarget()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setUI(eatType: EatType) {
        self.makeRounded(radius: 12)
        switch eatType {
        case .more:
            self.backgroundColor = .orange200.withAlphaComponent(0.25)
            titleLabel.text = Const.String.moreEat
            titleLabel.textColor = .orange600
            subLabel.text = Const.String.homeNewBottomSubMore
            snailImage.image = Const.Image.snailOrangeSpoon
        case .less:
            self.backgroundColor = .green500.withAlphaComponent(0.1)
            titleLabel.text = Const.String.lessEat
            titleLabel.textColor = .green600
            subLabel.text = Const.String.homeNewBottomSubLess
            snailImage.image = Const.Image.snailGreenRibon
        }
    }
    private func setLayout() {
        self.addSubviews(
            titleLabel,
            subLabel,
            snailImage
        )
        
        self.snp.makeConstraints {
            $0.width.equalTo(343.adjustedWidth)
            $0.height.equalTo(122.adjusted)
        }
        titleLabel.snp.makeConstraints {
            $0.top.equalToSuperview().offset(20.adjusted)
            $0.leading.equalToSuperview().offset(20.adjusted)
        }
        subLabel.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(10.adjusted)
            $0.leading.equalToSuperview().offset(20.adjusted)
        }
        snailImage.snp.makeConstraints {
            $0.top.equalToSuperview().offset(16.adjusted)
            $0.trailing.equalToSuperview().offset(-20.adjusted)
            $0.width.height.equalTo(100.adjustedWidth)
        }
    }
    
    private func setAddTarget() {
        let addMoreGoalGesture = UITapGestureRecognizer(target: self, action: #selector(addMoreGoalDidTap))
        self.addGestureRecognizer(addMoreGoalGesture)
    }
    
    @objc private func addMoreGoalDidTap() {
        switch eatType {
        case .more:
            handleNewGoalButtonDelegate?.pushNewGoalView(eatType: .more)
        case .less:
            handleNewGoalButtonDelegate?.pushNewGoalView(eatType: .less)
        }
    }
}
