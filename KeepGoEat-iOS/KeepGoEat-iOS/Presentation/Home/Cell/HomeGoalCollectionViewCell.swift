//
//  HomeGoalCollectionViewCell.swift
//  KeepGoEat-iOS
//
//  Created by 양정연 on 2023/01/06.
//

import UIKit

import SnapKit
import Then

enum KindType: String {
    case less
    case more
}
enum StateType: String {
    case before
    case after
}

class HomeGoalCollectionViewCell: UICollectionViewCell {
    // MARK: - Variables
    // MARK: Component
    private let kindTagImage = UIImageView().then {
        $0.image = Const.Image.moreTag
    }
    private let goalContentLabel = UILabel().then {
        $0.text = "오늘의 목표 내용"
    }
    private let goalCountLabel = UILabel().then {
        $0.attributedText = NSMutableAttributedString()
            .setCountTitleTextStyle(string: "8", isMore: true)
            .setCountSubTextStyle(string: Const.String.homeCountGuide)
    }
    private let achieveButton = HomeAchieveButton()

    // MARK: - Function
    // MARK: LifeCycle
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setUI()
        setLayout()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setUI() {
        self.backgroundColor = .gray50
        self.makeRounded(radius: 12.adjusted)
        self.layer.shadowColor = UIColor.gray400
        self.layer.shadowRadius = 4
    }
    private func setLayout() {
        self.addSubviews(
            kindTagImage,
            goalContentLabel,
            goalCountLabel,
            achieveButton
        )
        
        kindTagImage.snp.makeConstraints {
            $0.top.leading.equalToSuperview().offset(16.adjusted)
            $0.width.equalTo(60.adjusted)
            $0.height.equalTo(20.adjusted)
        }
        goalContentLabel.snp.makeConstraints {
            $0.leading.equalToSuperview().offset(16.adjusted)
            $0.top.equalTo(kindTagImage).offset(12.adjusted)
        }
        goalCountLabel.snp.makeConstraints {
            $0.top.equalTo(goalContentLabel).offset(10.adjusted)
            $0.leading.equalToSuperview().offset(16.adjusted)
        }
        achieveButton.snp.makeConstraints {
            $0.top.equalTo(goalCountLabel).offset(16.adjusted)
        }
    }
}
