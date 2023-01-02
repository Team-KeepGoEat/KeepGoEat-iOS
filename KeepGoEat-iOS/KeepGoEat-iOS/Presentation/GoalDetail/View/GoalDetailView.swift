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
    
    private let goalTitleLabel: UILabel = UILabel()
    
    private let goalStatsWrapView: UIView = UIView()
    
    private let previousGoalStatsView: GoalStatsView = GoalStatsView(frame: CGRect(), month: .previous)
    
    private let presentGoalStatsView: GoalStatsView = GoalStatsView(frame: CGRect(), month: .present)
    
    private let goalStatsBorderLineView: UIView = UIView()
    
    private lazy var goalStatsCollectionView: UICollectionView = UICollectionView()
    
    init(frame: CGRect, goalType: GoalType) {
        self.goalType = goalType
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
