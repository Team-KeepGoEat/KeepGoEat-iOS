//
//  StoreCollectionViewCell.swift
//  KeepGoEat-iOS
//
//  Created by 양정연 on 2023/01/09.
//

import UIKit

import SnapKit
import Then

class StoreCollectionViewCell: UICollectionViewCell {
    
    // MARK: - Variables
    // MARK: Identifier
    static let identifier = "HomeGoalCollectionViewCell"
    
    // MARK: Component
    private let shadowBaseView = UIView()
    private let kindTagImage = UIImageView().then {
        $0.image = Const.Image.moreTag
    }
    let detailButton = UIButton().then {
        $0.setImage(Const.Image.icnDetail, for: .normal)
    }
    private let goalContentLabel = UILabel().then {
        $0.font = .system2Bold
        $0.textColor = .gray800
    }
    private let totalSubLabel = UILabel().then {
        $0.font = .system5
        $0.text = Const.String.totalSub
        $0.textColor = .gray500
    }
    private let totalCountLabel = UILabel().then {
        $0.font = .systemDate
        $0.textColor = .green600
    }
    private let termSubLabel = UILabel().then {
        $0.font = .system5
        $0.text = Const.String.termSub
        $0.textColor = .gray500
    }
    private let termCountLabel = UILabel().then {
        $0.font = .system5
        $0.textColor = .gray700
    }
    
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
        self.setCellShadow(shadowBase: shadowBaseView)
    }
    private func setLayout() {
        self.addSubviews(
            shadowBaseView,
            kindTagImage,
            detailButton,
            goalContentLabel,
            totalSubLabel,
            totalCountLabel,
            termSubLabel,
            termCountLabel
        )
        
        shadowBaseView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        kindTagImage.snp.makeConstraints {
            $0.width.equalTo(60.adjusted)
            $0.height.equalTo(20.adjusted)
            $0.top.equalToSuperview().offset(16.adjusted)
            $0.leading.equalToSuperview().offset(20.adjusted)
        }
        detailButton.snp.makeConstraints {
            $0.width.height.equalTo(32.adjusted)
            $0.top.equalToSuperview().offset(12.adjusted)
            $0.trailing.equalToSuperview().offset(-18.adjusted)
        }
        goalContentLabel.snp.makeConstraints {
            $0.top.equalTo(kindTagImage.snp.bottom).offset(8.adjusted)
            $0.leading.equalToSuperview().offset(20.adjusted)
        }
        totalCountLabel.snp.makeConstraints {
            $0.top.equalTo(goalContentLabel.snp.bottom).offset(2.adjusted)
            $0.leading.equalToSuperview().offset(80.adjusted)
        }
        totalSubLabel.snp.makeConstraints {
            $0.centerY.equalTo(totalCountLabel)
            $0.leading.equalToSuperview().offset(20.adjusted)
        }
        termCountLabel.snp.makeConstraints {
            $0.bottom.equalToSuperview().offset(-16.adjusted)
            $0.leading.equalToSuperview().offset(81.adjusted)
        }
        termSubLabel.snp.makeConstraints {
            $0.centerY.equalTo(termCountLabel)
            $0.leading.equalToSuperview().offset(20.adjusted)
        }
    }

    func dataBind(data: StoreGoal) {
        if data.isMore {
            kindTagImage.image = Const.Image.moreTag
            totalCountLabel.textColor = .orange500
            goalContentLabel.text = "\(data.goalContent) \(Const.String.moreEat)"
        } else {
            kindTagImage.image = Const.Image.lessTag
            totalCountLabel.textColor = .green600
            goalContentLabel.text = "\(data.goalContent) \(Const.String.lessEat)"
        }
        totalCountLabel.text = String(data.totalCount)
        termCountLabel.text = "\(data.startedAt) ~ \(data.keptAt)"
    }
}
