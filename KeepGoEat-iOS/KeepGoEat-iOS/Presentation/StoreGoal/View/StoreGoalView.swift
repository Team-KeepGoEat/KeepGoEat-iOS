//
//  StoreGoalView.swift
//  KeepGoEat-iOS
//
//  Created by 양정연 on 2023/01/08.
//

import UIKit

import SnapKit
import Then
import Lottie

class StoreGoalView: UIView {

    // MARK: Component
    private let headerView = HeaderView()
    private let headerLabel = UILabel().then {
        $0.font = .system4Bold
        $0.textColor = .gray800
        $0.text = Const.String.storeTitle
    }
    private let totalButton = StoreFilterButton(frame: .zero, title: Const.String.storeFilterAll, selectType: .seleted)
    private let moreButton = StoreFilterButton(frame: .zero, title: Const.String.storeFilterMore, selectType: .unselected)
    private let lessButton = StoreFilterButton(frame: .zero, title: Const.String.storeFilterLess, selectType: .unselected)
    let animationView: LottieAnimationView = .init(name: "onboarding2_1x")
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUI()
        setLayout()
        setLottie()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setUI() {
        self.backgroundColor = .gray50
    }
    private func setLayout() {
        self.addSubviews(
            headerView,
            headerLabel,
            lessButton,
            moreButton,
            totalButton
        )
        
        headerView.snp.makeConstraints {
            $0.top.equalTo(self.safeAreaLayoutGuide)
        }
        headerLabel.snp.makeConstraints {
            $0.top.equalTo(headerView.snp.bottom).offset(24.adjusted)
            $0.leading.equalToSuperview().inset(-16.adjusted)
        }
        lessButton.snp.makeConstraints {
            $0.top.equalTo(headerView.snp.bottom).offset(24.adjusted)
            $0.trailing.equalToSuperview().inset(16.adjusted)
        }
        moreButton.snp.makeConstraints {
            $0.top.equalTo(headerView.snp.bottom).offset(24.adjusted)
            $0.trailing.equalTo(lessButton.snp.leading).inset(8.adjusted)
        }
        totalButton.snp.makeConstraints {
            $0.top.equalTo(headerView.snp.bottom).offset(24.adjusted)
            $0.trailing.equalTo(moreButton.snp.leading).inset(8.adjusted)
        }
    }
    private func setLottie() {
        self.addSubview(animationView)
        
        // animationView의 설정 작업은 알아서 하세요
        animationView.snp.makeConstraints {
            $0.center.equalToSuperview()
            $0.width.equalTo(375.adjusted)
            $0.height.equalTo(268.adjusted)
        }
        animationView.contentMode = .scaleAspectFit
        animationView.loopMode = .loop
        animationView.play()
    }
}
