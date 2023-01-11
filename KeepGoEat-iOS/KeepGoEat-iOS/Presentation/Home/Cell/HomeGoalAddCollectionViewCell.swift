//
//  HomeGoalAddCollectionViewCell.swift
//  KeepGoEat-iOS
//
//  Created by 양정연 on 2023/01/11.
//

import UIKit

import SnapKit
import Then

class HomeGoalAddCollectionViewCell: UICollectionViewCell {
    // MARK: - Variables
    static let identifier = "HomeGoalAddCollectionViewCell"
    
    // MARK: Component
    private let containerView = UIView().then {
        $0.backgroundColor = .orange20
        $0.makeColorRounded(12, 1, .orange50)
    }
    private let titleLabel = UILabel().then {
        $0.text = Const.String.homeNewTitle
        $0.font = .system5Bold
        $0.textColor = .orange600
    }
    private let subLabel = UILabel().then {
        $0.font = .system5
        $0.textColor = .gray600
    }
    private let newGoalImage = UIImageView().then {
        $0.image = Const.Image.icnRight
    }
    
    // MARK: - Function
    // MARK: LifeCycle
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: Layout Helpers
    private func setLayout() {
        self.addSubview(containerView)
        containerView.addSubviews(
            titleLabel,
            subLabel,
            newGoalImage
        )
        
        containerView.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalToSuperview()
            $0.width.equalTo(343.adjustedWidth)
            $0.height.equalTo(82.adjusted)
        }
        titleLabel.snp.makeConstraints {
            $0.top.equalToSuperview().inset(24)
            $0.leading.equalToSuperview().inset(16)
        }
        subLabel.snp.makeConstraints {
            $0.bottom.equalToSuperview().inset(20)
            $0.leading.equalToSuperview().inset(16)
        }
        newGoalImage.snp.makeConstraints {
            $0.width.height.equalTo(32.adjusted)
            $0.centerY.equalToSuperview()
            $0.trailing.equalToSuperview().inset(8)
        }
    }
    
    func setSubTitleText(count: Int) {
        switch count {
        case 1:
            subLabel.text = Const.String.homeNewSub1
            newGoalImage.isHidden = false
            self.isUserInteractionEnabled = true
        case 2:
            subLabel.text = Const.String.homeNewSub2
            newGoalImage.isHidden = false
            self.isUserInteractionEnabled = true
        case 3:
            subLabel.text = Const.String.homeNewSub3
            newGoalImage.isHidden = true
            self.isUserInteractionEnabled = false
        default:
            subLabel.text = ""
        }
    }
}
