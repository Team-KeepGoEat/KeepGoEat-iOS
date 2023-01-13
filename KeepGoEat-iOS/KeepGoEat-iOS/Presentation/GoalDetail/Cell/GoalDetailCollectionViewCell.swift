//
//  GoalDetailCollectionViewCell.swift
//  KeepGoEat-iOS
//
//  Created by 이승헌 on 2023/01/02.
//

import UIKit

class GoalDetailCollectionViewCell: UICollectionViewCell {
    
    // MARK: Identifier
    static let identifier = "GoalDetailCollectionViewCell"
    
    // MARK: Component
    private let stampImageView: UIImageView = UIImageView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUI()
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension GoalDetailCollectionViewCell {
    private func setUI() {
        backgroundColor = .orange200Opacity3
    }
    
    private func setLayout() {
        contentView.addSubview(
            stampImageView
        )
        
        stampImageView.snp.makeConstraints {
            $0.width.equalTo(43.adjusted)
            $0.height.equalTo(43.adjusted)
            $0.centerY.equalToSuperview()
            $0.centerX.equalToSuperview()
        }
    }
    
    public func dataBind(model: GoalDetailStampModel) {
        stampImageView.image = model.stampImage
    }
}
