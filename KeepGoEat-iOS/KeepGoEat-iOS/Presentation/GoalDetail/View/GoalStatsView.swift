//
//  GoalStatsView.swift
//  KeepGoEat-iOS
//
//  Created by 이승헌 on 2023/01/03.
//

import UIKit

class GoalStatsView: UIView {
    
    // MARK: Component
    let goalStatsTitleLabel: UILabel = UILabel().then {
        $0.font = .system5
        $0.textColor = .gray600
    }
    
    let goalStatsCountLabel: UILabel = UILabel().then {
        $0.text = "4"
        $0.font = .systemDate
        $0.textColor = .gray700
    }
    
    override init(frame: CGRect) {
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
    }
    
    private func setLayout() {
        self.addSubviews(
            goalStatsTitleLabel,
            goalStatsCountLabel
        )
        
        self.snp.makeConstraints {
            $0.width.equalTo(80.adjusted)
        }
        
        goalStatsTitleLabel.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.centerX.equalToSuperview()
        }
        
        goalStatsCountLabel.snp.makeConstraints {
            $0.bottom.equalToSuperview()
            $0.centerX.equalToSuperview()
        }
    }
}
