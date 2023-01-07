//
//  HomeExistView.swift
//  KeepGoEat-iOS
//
//  Created by 양정연 on 2023/01/07.
//

import UIKit

import SnapKit
import Then

class HomeExistView: UIView {

    // MARK: - Variables
    // MARK: Component
    private let homeBaseView = HomeBaseView()
    private let layout = UICollectionViewFlowLayout().then {
        $0.estimatedItemSize = CGSize(width: 343.adjustedWidth, height: 184.adjusted)
        $0.footerReferenceSize = CGSize(width: 343.adjustedWidth, height: 82.adjusted)
        $0.minimumLineSpacing = 16.adjusted
        $0.sectionInset = UIEdgeInsets(top: 24.adjusted, left: 0, bottom: 16.adjusted, right: 0)
    }
    private lazy var homeGoalCollectionView = HomeGoalCollectionView(frame: .zero, collectionViewLayout: layout).then {
        $0.isScrollEnabled = false
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
        self.addSubview(homeBaseView)
        homeBaseView.addSubview(homeGoalCollectionView)
        
        homeBaseView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        homeGoalCollectionView.snp.makeConstraints {
            $0.top.equalTo(homeBaseView.homeHeaderLabel.snp.bottom)
            $0.horizontalEdges.bottom.equalToSuperview()
        }
    }
}
