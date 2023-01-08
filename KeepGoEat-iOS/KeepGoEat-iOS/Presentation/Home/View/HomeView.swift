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
        
        setLayout()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: Layout Helpers
    private func setBackgroundColor(timezoneType: TimezoneType) {
        switch timezoneType {
        case .day:
            self.backgroundColor = .homeBg0
        case .sun:
            self.backgroundColor = .homeBg1
        case .night:
            self.backgroundColor = .homeBg2
        }
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
    
    // MARK: Custom Function
    func updateCheerBackgroundUI(timezoneType: TimezoneType) {
        setBackgroundColor(timezoneType: timezoneType)
        homeCheerView.setBackgroundImage(timezoneType: timezoneType)
    }
}
