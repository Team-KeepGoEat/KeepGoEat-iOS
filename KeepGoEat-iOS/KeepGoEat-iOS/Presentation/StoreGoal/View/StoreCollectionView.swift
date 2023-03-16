//
//  StoreCollectionView.swift
//  KeepGoEat-iOS
//
//  Created by 양정연 on 2023/01/09.
//

import UIKit

protocol handleMoreButtonDelegate {
    func moreButtonDidTap(goalId: Int)
}

class StoreCollectionView: UICollectionView {
    
    // MARK: - Variables
//    weak var moreButtonDelegate: handleMoreButtonDelegate?

    override init(frame: CGRect, collectionViewLayout layout: UICollectionViewLayout) {
        super.init(frame: frame, collectionViewLayout: layout)
        
        setRegister()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setRegister() {
        self.register(StoreCollectionViewCell.self, forCellWithReuseIdentifier: StoreCollectionViewCell.identifier)
    }
}
