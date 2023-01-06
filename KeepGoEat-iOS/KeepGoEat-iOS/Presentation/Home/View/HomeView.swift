//
//  HomeView.swift
//  KeepGoEat-iOS
//
//  Created by 양정연 on 2023/01/06.
//

import UIKit

import SnapKit

class HomeView: UIView {
    
    // MARK: - Variables
    // MARK: Component
    private let homeCheerView = HomeCheerView()
    private let homeEmptyView = HomeEmptyView()
    
    // MARK: - Function
    // MARK: LifeCycle
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setBackgroundColor()
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: Layout Helpers
    private func setBackgroundColor() {
        self.backgroundColor = .homeBg0
    }
    
    private func setLayout() {
        self.addSubviews(
            homeCheerView,
            homeEmptyView
        )
        
        homeCheerView.snp.makeConstraints {
            $0.top.horizontalEdges.equalTo(self.safeAreaLayoutGuide)
        }
        homeEmptyView.snp.makeConstraints {
            $0.top.equalTo(homeCheerView.snp.bottom).inset(5.adjusted)
            $0.horizontalEdges.bottom.equalToSuperview()
        }
    }
}
