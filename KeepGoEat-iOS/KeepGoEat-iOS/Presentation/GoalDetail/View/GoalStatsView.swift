//
//  GoalStatsView.swift
//  KeepGoEat-iOS
//
//  Created by 이승헌 on 2023/01/03.
//

import UIKit

enum Month: String {
    case previous
    case present
}

class GoalStatsView: UIView {
    
    // MARK: Variables
    private let month: Month
    
    // MARK: Component
    private let goalStatsTitleLabel: UILabel = UILabel().then {
        $0.font = .system5
        $0.textColor = .gray600
    }
    
    private let goalStatsCountLabel: UILabel = UILabel().then {
        $0.font = .systemDate
    }
    
    init(frame: CGRect, month: Month) {
        self.month = month
        super.init(frame: frame)
        setUI()
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension GoalStatsView {
    private func setUI() {
        self.backgroundColor = .white
        
        switch month {
        case .previous:
            goalStatsTitleLabel.text = Const.String.previousGoalStatsTitle
            goalStatsCountLabel.textColor = .gray700
        case .present:
            goalStatsTitleLabel.text = Const.String.presentGoalStatsTitle
            goalStatsCountLabel.textColor = .orange600
        }
    }
    
    private func setLayout() {
        self.addSubviews(
            goalStatsTitleLabel,
            goalStatsCountLabel
        )
        
        goalStatsTitleLabel.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.directionalHorizontalEdges.equalToSuperview()
        }
        
        goalStatsCountLabel.snp.makeConstraints {
            $0.bottom.equalToSuperview()
            $0.centerX.equalToSuperview()
        }
    }
}
