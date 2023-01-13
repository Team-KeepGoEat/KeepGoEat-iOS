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
    var homeType: HomeType {
        didSet {
            setUI()
            setViewType()
        }
    }
    
    // MARK: Component
    let homeCheerView = HomeCheerView()
    let homeEmptyView = HomeEmptyView()
    let homeExistView = HomeExistView()
    let dimmedView: UIView = UIView().then {
        $0.backgroundColor = .black.withAlphaComponent(0.5)
        $0.isHidden = true
    }
    let bottomSheetView: BottomSheetView = BottomSheetView()
    let homeBottomSheetView = HomeBottomSheetView()
    
    // MARK: - Function
    // MARK: LifeCycle
    override init(frame: CGRect) {
        self.homeType = .empty
        super.init(frame: frame)
        
        setLayout()
        setUI()
        setViewType()
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
    
    private func setViewType() {
        switch homeType {
        case .exist:
            homeExistView.isHidden = false
            homeEmptyView.isHidden = true
        case .empty:
            homeExistView.isHidden = true
            homeEmptyView.isHidden = false
        }
    }
    
    private func setLayout() {
        self.addSubviews(
            homeCheerView,
            homeExistView,
            homeEmptyView,
            dimmedView,
            bottomSheetView
        )
        bottomSheetView.addSubview(homeBottomSheetView)
        
        homeCheerView.snp.makeConstraints {
            $0.top.horizontalEdges.equalTo(self.safeAreaLayoutGuide)
        }
        homeExistView.snp.makeConstraints {
            $0.top.equalTo(homeCheerView.snp.bottom).inset(5.adjusted)
            $0.horizontalEdges.bottom.equalToSuperview()
        }
        homeEmptyView.snp.makeConstraints {
            $0.top.equalTo(homeCheerView.snp.bottom).inset(5.adjusted)
            $0.horizontalEdges.bottom.equalToSuperview()
        }
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
