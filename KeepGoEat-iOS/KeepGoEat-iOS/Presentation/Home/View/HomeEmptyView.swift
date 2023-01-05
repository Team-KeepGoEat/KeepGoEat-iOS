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
        $0.setImage(Const.Image.plateGrayView1)
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
        
        homeBaseView.snp.makeConstraints {
            $0.top.equalTo(homeCheerView.snp.bottom).inset(5.adjusted)
            $0.horizontalEdges.bottom.equalToSuperview()
        }
    }
}
