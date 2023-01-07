//
//  HomeView.swift
//  KeepGoEat-iOS
//
//  Created by 양정연 on 2023/01/06.
//

import UIKit

import SnapKit
import Then

enum HomeType: String {
    case exist
    case empty
}

class HomeView: UIView {
    
    // MARK: - Variables
    private let homeType: HomeType = .exist
    
    // MARK: Component
    private let homeCheerView = HomeCheerView()
    private let homeEmptyView = HomeEmptyView()
    private let homeExistView = HomeExistView()
    private let scrollView = UIScrollView().then {
        $0.showsHorizontalScrollIndicator = false
    }
    private let contentView = UIView()
    
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
    
    private func setUI() {
        switch homeType {
        case .exist:
            homeCheerView.setCharacterImage(characterType: .cheer)
        case .empty:
            homeCheerView.setCharacterImage(characterType: .hungry)
        }
    }
    
    private func setLayout() {
        switch homeType {
        case .exist:
            self.addSubview(scrollView)
            scrollView.addSubview(contentView)
            contentView.addSubviews(
                homeCheerView,
                homeExistView
            )
            
            scrollView.snp.makeConstraints {
                $0.edges.equalToSuperview()
            }
            contentView.snp.makeConstraints {
                $0.edges.equalTo(scrollView.contentLayoutGuide)
                $0.width.equalTo(scrollView.snp.width)
                $0.height.greaterThanOrEqualTo(scrollView.snp.height).priority(.low)
                $0.bottom.equalTo(scrollView.snp.bottom)
            }
            homeCheerView.snp.makeConstraints {
                $0.top.horizontalEdges.equalToSuperview()
//                $0.width.equalTo(con.snp.width)
            }
            homeExistView.snp.makeConstraints {
                $0.top.equalTo(homeCheerView.snp.bottom).inset(5.adjusted)
                $0.horizontalEdges.bottom.equalToSuperview()
            }
        case .empty:
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
    
    // MARK: Custom Function
    func updateCheerBackgroundUI(timezoneType: TimezoneType) {
        setBackgroundColor(timezoneType: timezoneType)
        homeCheerView.setBackgroundImage(timezoneType: timezoneType)
    }
}
