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
        self.backgroundColor = .homeBackground
    }
    
    private func setLayout() {
        self.addSubviews(
            homeCheerView
        )
        
        homeCheerView.snp.makeConstraints {
            $0.top.horizontalEdges.equalTo(self.safeAreaLayoutGuide)
        }
    }
}
