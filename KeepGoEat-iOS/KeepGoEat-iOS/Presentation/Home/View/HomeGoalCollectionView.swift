//
//  HomeGoalCollectionView.swift
//  KeepGoEat-iOS
//
//  Created by 양정연 on 2023/01/07.
//

import UIKit

class HomeGoalCollectionView: UICollectionView {
    
    // MARK: - Variables
    let data = GetHomeResponse.setHomeDummy3()

    override init(frame: CGRect, collectionViewLayout layout: UICollectionViewLayout) {
        super.init(frame: frame, collectionViewLayout: layout)
        
        setRegister()
        backgroundColor = .clear
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setRegister() {
        self.dataSource = self
        self.delegate = self
        self.register(HomeGoalCollectionViewCell.self, forCellWithReuseIdentifier: HomeGoalCollectionViewCell.identifier)
        self.register(HomeGoalCollectionReusableView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionFooter, withReuseIdentifier: HomeGoalCollectionReusableView.identifier)
    }
}

// MARK: - extension
// MARK: UICollectionViewDataSource
extension HomeGoalCollectionView: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let goalCell = collectionView.dequeueReusableCell(withReuseIdentifier: HomeGoalCollectionViewCell.identifier, for: indexPath) as? HomeGoalCollectionViewCell else { return UICollectionViewCell() }
        goalCell.databind(data: data.goals[indexPath.item])
        return goalCell
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return data.goalCount
    }
}

// MARK: UICollectionViewDelegateFlowLayout
extension HomeGoalCollectionView: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        if kind == UICollectionView.elementKindSectionFooter {
            let footer = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: HomeGoalCollectionReusableView.identifier, for: indexPath)
            return footer
        } else {
            return UICollectionReusableView()
        }
    }
}