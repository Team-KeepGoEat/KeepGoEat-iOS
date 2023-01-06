//
//  HomeBaseView.swift
//  KeepGoEat-iOS
//
//  Created by 양정연 on 2023/01/06.
//

import UIKit

import SnapKit

class HomeBaseView: UIView {
    
    // MARK: - Variables
    // MARK: Component
    let homeHeaderLabel = UILabel().then {
        $0.text = Const.String.hoemHeader
        $0.font = .system2Bold
        $0.textColor = .gray700
    }
    
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
    
    // MARK: Layout Helpers
    private func setUI() {
        self.backgroundColor = .white
        self.makeTopRounded(radius: 4)
    }
    
    private func setLayout() {
        self.addSubviews(
            homeHeaderLabel
        )
        
        self.snp.makeConstraints {
            $0.edges.equalTo(self.safeAreaLayoutGuide)
        }
        homeHeaderLabel.snp.makeConstraints {
            $0.top.equalTo(self.snp.top).inset(20.adjusted)
            $0.leading.equalTo(self.snp.leading).inset(16.adjusted)
        }
    }
}
