//
//  StoreGoalView.swift
//  KeepGoEat-iOS
//
//  Created by 양정연 on 2023/01/08.
//

import UIKit

import SnapKit
import Then

class StoreGoalView: UIView {

    // MARK: - Variables
    let dummyData: GetStoreGoalResponse = getStoreGoalDataList[1]
    
    // MARK: Component
    private let headerView = HeaderView()
    private let headerLabel = UILabel().then {
        $0.font = .system4Bold
        $0.textColor = .gray800
        $0.text = Const.String.storeTitle
    }
    private let totalButton = StoreFilterButton(frame: .zero, title: Const.String.storeFilterAll, selectType: .seleted)
    private let moreButton = StoreFilterButton(frame: .zero, title: Const.String.storeFilterMore, selectType: .unselected)
    private let lessButton = StoreFilterButton(frame: .zero, title: Const.String.storeFilterLess, selectType: .unselected)
    private let layout = UICollectionViewFlowLayout().then {
        $0.estimatedItemSize = CGSize(width: 343.adjustedWidth, height: 160.adjusted)
        $0.minimumLineSpacing = 16.adjusted
        $0.sectionInset = UIEdgeInsets(top: 3.adjusted, left: 0, bottom: 16.adjusted, right: 0)
    }
    private lazy var storeCollectionView = StoreCollectionView(frame: .zero, collectionViewLayout: layout)
    
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
        self.backgroundColor = .gray50
    }
    private func setLayout() {
        self.addSubviews(
            headerView,
            headerLabel,
            lessButton,
            moreButton,
            totalButton,
            storeCollectionView
        )
        
        headerView.snp.makeConstraints {
            $0.top.equalTo(self.safeAreaLayoutGuide)
        }
        headerLabel.snp.makeConstraints {
            $0.top.equalTo(headerView.snp.bottom).offset(24.adjusted)
            $0.leading.equalToSuperview().offset(16.adjusted)
        }
        lessButton.snp.makeConstraints {
            $0.top.equalTo(headerView.snp.bottom).offset(24.adjusted)
            $0.trailing.equalToSuperview().offset(-16.adjusted)
        }
        moreButton.snp.makeConstraints {
            $0.top.equalTo(headerView.snp.bottom).offset(24.adjusted)
            $0.trailing.equalTo(lessButton.snp.leading).offset(-8.adjusted)
        }
        totalButton.snp.makeConstraints {
            $0.top.equalTo(headerView.snp.bottom).offset(24.adjusted)
            $0.trailing.equalTo(moreButton.snp.leading).offset(-8.adjusted)
        }
        storeCollectionView.snp.makeConstraints {
            $0.top.equalTo(headerLabel).offset(24.adjusted)
            $0.horizontalEdges.bottom.equalToSuperview()
        }
    }
}
