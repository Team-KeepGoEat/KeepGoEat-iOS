//
//  GoalDetailView.swift
//  KeepGoEat-iOS
//
//  Created by 이승헌 on 2023/01/02.
//

import UIKit

import Then

enum GoalType: String {
    case more
    case less
}

class GoalDetailView: UIView {
    
    // MARK: - Variables
    private let goalType: GoalType
    
    // MARK: Component
    private let goalTypeImageView: UIImageView = UIImageView()
    
    private let goalTitleLabel: UILabel = UILabel().then {
        $0.text = "하루 1끼 이상 야채 더 먹기"
        $0.font = .system2Bold
        $0.textColor = .gray800
    }
    
    private let goalStatsWrapView: UIView = UIView().then {
        $0.layer.borderWidth = 1
        $0.layer.borderColor = UIColor.gray300.cgColor
        $0.layer.cornerRadius = 8
    }
    
    private let previousGoalStatsView: GoalStatsView = GoalStatsView(frame: CGRect(), month: .previous)
    
    private let presentGoalStatsView: GoalStatsView = GoalStatsView(frame: CGRect(), month: .present)
    
    private let goalStatsBorderLineView: UIView = UIView().then {
        $0.backgroundColor = .gray300
    }
    
    private lazy var goalStatsStackView: UIStackView = UIStackView(arrangedSubviews: [
        previousGoalStatsView,
        goalStatsBorderLineView,
        presentGoalStatsView
    ]).then {
        $0.axis = .horizontal
        $0.distribution = .equalSpacing
    }
    
    private lazy var goalStatsCollectionView: UICollectionView = UICollectionView()
    
    init(frame: CGRect, goalType: GoalType) {
        self.goalType = goalType
        super.init(frame: frame)
        setUI()
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension GoalDetailView {
    private func setUI() {
        self.backgroundColor = .white
        
        switch goalType {
        case .more:
            goalTypeImageView.image = Const.Image.moreTag
        case .less:
            goalTypeImageView.image = Const.Image.lessTag
        }
    }
    
    private func setLayout() {
        self.addSubviews(
            goalTypeImageView,
            goalTitleLabel,
            goalStatsWrapView
        )
        
        goalStatsWrapView.addSubview(
            goalStatsStackView
        )
        
        goalTypeImageView.snp.makeConstraints {
            $0.top.equalTo(self.safeAreaLayoutGuide).inset(72.adjusted)
            $0.leading.equalTo(self.safeAreaLayoutGuide).inset(20.adjustedWidth)
        }
        
        goalTitleLabel.snp.makeConstraints {
            $0.top.equalTo(goalTypeImageView.snp.bottom).inset(-8.adjusted)
            $0.leading.equalTo(self.safeAreaLayoutGuide).inset(20.adjustedWidth)
        }
        
        goalStatsBorderLineView.snp.makeConstraints {
            $0.width.equalTo(1)
            $0.height.equalTo(80.adjusted)
        }
        
        goalStatsWrapView.snp.makeConstraints {
            $0.top.equalTo(goalTitleLabel.snp.bottom).inset(-12.adjusted)
            $0.directionalHorizontalEdges.equalTo(self.safeAreaLayoutGuide).inset(20.adjustedWidth)
            $0.height.equalTo(152.adjusted)
        }
        
        goalStatsStackView.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.centerY.equalToSuperview()
            $0.width.equalTo(240.adjusted)
            $0.height.equalTo(80.adjusted)
        }
    }
}
