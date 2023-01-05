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
    private let headerView: HeaderView = HeaderView()
    
    private let headerViewTitle: UILabel = UILabel().then {
        $0.font = .system4Bold
        $0.text = Const.String.myGoal
    }
    
    private let editGoalButton: UIButton = UIButton().then {
        $0.setImage(Const.Image.icnPen, for: .normal)
    }
    
    private let saveGoalButton: UIButton = UIButton().then {
        $0.setImage(Const.Image.icnBox, for: .normal)
    }
    
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
    
    private let previousGoalStatsView: GoalStatsView = GoalStatsView(frame: CGRect(), text: Const.String.previousGoalStatsTitle)
    
    private let presentGoalStatsView: GoalStatsView = GoalStatsView(frame: CGRect(), text: Const.String.presentGoalStatsTitle)
    
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
    
    private let collectionViewFlowLayout: UICollectionViewFlowLayout = UICollectionViewFlowLayout().then {
        $0.scrollDirection = .vertical
    }
    
    private lazy var goalStatsCollectionView: GoalDetailCollectionView = GoalDetailCollectionView(frame: .zero, collectionViewLayout: collectionViewFlowLayout, goalType: goalType)
    
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
            presentGoalStatsView.goalStatsCountLabel.textColor = .orange600
        case .less:
            goalTypeImageView.image = Const.Image.lessTag
            presentGoalStatsView.goalStatsCountLabel.textColor = .green600
        }
    }
    
    private func setLayout() {
        self.addSubviews(
            headerView,
            goalTypeImageView,
            goalTitleLabel,
            goalStatsWrapView,
            goalStatsCollectionView
        )
        
        headerView.addSubviews(
            editGoalButton,
            headerViewTitle,
            saveGoalButton
        )
        
        goalStatsWrapView.addSubview(
            goalStatsStackView
        )
        
        headerView.snp.makeConstraints {
            $0.top.equalTo(self.safeAreaLayoutGuide)
        }
        
        headerViewTitle.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.centerX.equalToSuperview()
        }
        
        editGoalButton.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.trailing.equalTo(saveGoalButton.snp.leading).inset(-4.adjusted)
        }
        
        saveGoalButton.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.trailing.equalToSuperview().inset(16.adjusted)
        }
        
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
        
        goalStatsCollectionView.snp.makeConstraints {
            $0.bottom.equalToSuperview().inset(101.adjusted)
            $0.width.equalTo(336.adjusted)
            $0.height.equalTo(240.adjusted)
            $0.centerX.equalToSuperview()
        }
    }
}
