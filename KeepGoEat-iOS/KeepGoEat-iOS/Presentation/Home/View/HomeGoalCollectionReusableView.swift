//
//  HomeGoalCollectionReusableView.swift
//  KeepGoEat-iOS
//
//  Created by 양정연 on 2023/01/07.
//

import UIKit

import SnapKit
import Then

class HomeGoalCollectionReusableView: UICollectionReusableView {
    // MARK: - Variables
    static let identifier = "HomeGoalCollectionReusableView"
    
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
    private func setUI() {
        self.backgroundColor = .orange50
        self.makeColorRounded(12, 1, .orange400)
    }
    private func setLayout() {
        self.snp.makeConstraints {
            $0.edges.equalTo(343.adjustedWidth)
        }
    }
}
