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
    let homeEmptyView = HomeEmptyView()
    let homeExistView = HomeExistView()
    let dimmedView: UIView = UIView().then {
        $0.backgroundColor = .black.withAlphaComponent(0.5)
        $0.isHidden = true
    }
    let bottomSheetView: BottomSheetView = BottomSheetView()
    private let homeBottomSheetView = HomeBottomSheetView()
    
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
        self.addSubview(homeCheerView)
        
        homeCheerView.snp.makeConstraints {
            $0.top.horizontalEdges.equalTo(self.safeAreaLayoutGuide)
        }
        
        switch homeType {
        case .exist:
            self.addSubview(homeExistView)
            homeExistView.snp.makeConstraints {
                $0.top.equalTo(homeCheerView.snp.bottom).inset(5.adjusted)
                $0.horizontalEdges.bottom.equalToSuperview()
            }
        case .empty:
            self.addSubview(homeEmptyView)
            homeEmptyView.snp.makeConstraints {
                $0.top.equalTo(homeCheerView.snp.bottom).inset(5.adjusted)
                $0.horizontalEdges.bottom.equalToSuperview()
            }
        }
        self.addSubviews(
            dimmedView,
            bottomSheetView
        )
        bottomSheetView.addSubview(homeBottomSheetView)
        
        bottomSheetView.snp.makeConstraints {
            $0.top.equalToSuperview().inset(UIScreen.main.bounds.height)
            $0.height.equalTo(325.adjusted)
            $0.directionalHorizontalEdges.equalToSuperview()
        }
        
        dimmedView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        homeBottomSheetView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
    
    // MARK: Custom Function
    func updateCheerBackgroundUI(timezoneType: TimezoneType) {
        setBackgroundColor(timezoneType: timezoneType)
        homeCheerView.setBackgroundImage(timezoneType: timezoneType)
    }
}
