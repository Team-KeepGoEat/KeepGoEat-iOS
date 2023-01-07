//
//  HomeGoalCollectionViewCell.swift
//  KeepGoEat-iOS
//
//  Created by 양정연 on 2023/01/06.
//

import UIKit

import SnapKit
import Then

class HomeGoalCollectionViewCell: UICollectionViewCell {
    // MARK: - Variables
    // MARK: Identifier
    static let identifier = "HomeGoalCollectionViewCell"
    
    // MARK: Component
    private let backView = UIView()
    private let kindTagImage = UIImageView().then {
        $0.image = Const.Image.moreTag
    }
    private let goalContentLabel = UILabel().then {
        $0.font = .system4Bold
        $0.text = "오늘의 목표 내용"
    }
    private let goalCountLabel = UILabel().then {
        $0.attributedText = NSMutableAttributedString()
            .setCountTitleTextStyle(string: "8", isMore: true)
            .setCountSubTextStyle(string: Const.String.homeCountGuide)
    }
    private let achieveButton = HomeAchieveButton(frame: .zero)

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
    
    private func setUI() {
//        self.backgroundColor = .gray50
//        self.makeRounded(radius: 12.adjusted)
//        self.makeColorRounded(12.adjusted, 1, .gray400)
//        self.layer.shadowColor = UIColor.gray400.cgColor
//        self.layer.shadowRadius = 4
        self.setCellShadow(backView: backView)
    }
    private func setLayout() {
        self.addSubviews(
            backView,
            kindTagImage,
            goalContentLabel,
            goalCountLabel,
            achieveButton
        )
        
        backView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        kindTagImage.snp.makeConstraints {
            $0.top.leading.equalToSuperview().offset(16.adjusted)
            $0.width.equalTo(60.adjusted)
            $0.height.equalTo(20.adjusted)
        }
        goalContentLabel.snp.makeConstraints {
            $0.leading.equalToSuperview().offset(16.adjusted)
            $0.top.equalTo(kindTagImage.snp.bottom).offset(12.adjusted)
        }
        goalCountLabel.snp.makeConstraints {
            $0.top.equalTo(goalContentLabel.snp.bottom).offset(6.adjusted)
            $0.leading.equalToSuperview().offset(16.adjusted)
        }
        achieveButton.snp.makeConstraints {
            $0.bottom.equalToSuperview().offset(-16.adjusted)
            $0.centerX.equalToSuperview()
        }
    }
    func databind(data: Goal) {
        if data.isMore {
            kindTagImage.image = Const.Image.moreTag
            goalContentLabel.text = data.goalContent + " 더 먹기"
            goalCountLabel.attributedText = NSMutableAttributedString()
                .setCountTitleTextStyle(string: String(data.thisMonthCount), isMore: true)
                .setCountSubTextStyle(string: Const.String.homeCountGuide)
            achieveButton.setUI(kindType: .more, stateType: data.isAchieved ? .after : .before)
        } else {
            kindTagImage.image = Const.Image.lessTag
            goalContentLabel.text = data.goalContent + " 덜 먹기"
            goalCountLabel.attributedText = NSMutableAttributedString()
                .setCountTitleTextStyle(string: String(data.thisMonthCount), isMore: false)
                .setCountSubTextStyle(string: Const.String.homeCountGuide)
            achieveButton.setUI(kindType: .less, stateType: data.isAchieved ? .after : .before)
        }
    }
}