//
//  HomeEmptyView.swift
//  KeepGoEat-iOS
//
//  Created by 양정연 on 2023/01/06.
//

import UIKit

import SnapKit
import Then

class HomeEmptyView: UIView {
    
    // MARK: - Variables
    // MARK: Component
    private let homeBaseView = HomeBaseView()
    private let emptyImage = UIImageView().then {
        $0.image = Const.Image.plateGrayView1
    }
    private let emptyTitleLabel = UILabel().then {
        $0.text = Const.String.homeEmptyTitle
        $0.font = .system3Bold
        $0.textColor = .gray700
    }
    private let emptySubLabel = UILabel().then {
        $0.text = Const.String.homeEmptySub
        $0.font = .system4
        $0.textColor = .gray600
    }
    private let addGoalButton = UIButton().then {
        $0.backgroundColor = .orange600
        $0.setTitle(Const.String.addGoal, for: .normal)
        $0.setImage(Const.Image.icnPlus, for: .normal)
        $0.setTitleColor(.gray50, for: .normal)
        $0.titleLabel?.font = .system4Bold
        $0.layer.cornerRadius = 8
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
        self.addSubviews(
            homeBaseView
        )
        homeBaseView.addSubviews(
            emptyImage,
            emptyTitleLabel,
            emptySubLabel,
            addGoalButton
        )
        
        homeBaseView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        emptyImage.snp.makeConstraints {
            $0.width.height.equalTo(140.adjusted)
            $0.top.equalTo(homeBaseView.homeHeaderLabel.snp.bottom).inset(-30.adjusted)
            $0.centerX.equalToSuperview()
        }
        emptyTitleLabel.snp.makeConstraints {
            $0.top.equalTo(emptyImage.snp.bottom).inset(-8.adjusted)
            $0.centerX.equalToSuperview()
        }
        emptySubLabel.snp.makeConstraints {
            $0.top.equalTo(emptyTitleLabel.snp.bottom).inset(-12.adjusted)
            $0.centerX.equalToSuperview()
        }
        addGoalButton.snp.makeConstraints {
            $0.horizontalEdges.equalTo(self.safeAreaLayoutGuide).inset(16.adjusted)
            $0.bottom.equalToSuperview().inset(44.adjusted)
            $0.height.equalTo(48.adjusted)
        }
    }
}
