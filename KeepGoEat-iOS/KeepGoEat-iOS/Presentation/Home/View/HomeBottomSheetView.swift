//
//  HomeBottomSheetView.swift
//  KeepGoEat-iOS
//
//  Created by 양정연 on 2023/01/10.
//

import UIKit

class HomeBottomSheetView: UIView {
    
    let moreBottomView = HomeNewGoalTypeView(frame: .zero, eatType: .more)
    let lessBottomView = HomeNewGoalTypeView(frame: .zero, eatType: .less)

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setLayout() {
        self.addSubviews(
            moreBottomView,
            lessBottomView
        )
        
        moreBottomView.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalToSuperview().offset(20.adjusted)
        }
        lessBottomView.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(moreBottomView.snp.bottom).offset(16.adjusted)
        }
    }
}
