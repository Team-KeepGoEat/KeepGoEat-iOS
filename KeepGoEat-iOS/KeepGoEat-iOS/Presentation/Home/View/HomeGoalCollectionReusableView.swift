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
    private let titleLabel = UILabel().then {
        $0.text = Const.String.homeNewTitle
        $0.font = .system5Bold
        $0.textColor = .orange600
    }
    private let subLabel = UILabel().then {
        $0.font = .system5
        $0.textColor = .gray600
    }
    private let newGoalButton = UIButton().then {
        $0.setImage(Const.Image.icnRight, for: .normal)
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

    // MARK: Layout Helpers
    private func setUI() {
        self.backgroundColor = .orange20
        self.makeColorRounded(12, 1, .orange50)
    }
    private func setLayout() {
        self.addSubviews(
            titleLabel,
            subLabel,
            newGoalButton
        )
        
        titleLabel.snp.makeConstraints {
            $0.top.equalToSuperview().inset(24)
            $0.leading.equalToSuperview().inset(16)
        }
        subLabel.snp.makeConstraints {
            $0.bottom.equalToSuperview().inset(20)
            $0.leading.equalToSuperview().inset(16)
        }
        newGoalButton.snp.makeConstraints {
            $0.width.height.equalTo(32.adjusted)
            $0.centerY.equalToSuperview()
            $0.trailing.equalToSuperview().inset(8)
        }
    }
    
    func setSubTitleText(count: Int) {
        switch count {
        case 1:
            subLabel.text = Const.String.homeNewSub1
        case 2:
            subLabel.text = Const.String.homeNewSub2
        case 3:
            subLabel.text = Const.String.homeNewSub3
        default:
            subLabel.text = ""
        }
    }
}
