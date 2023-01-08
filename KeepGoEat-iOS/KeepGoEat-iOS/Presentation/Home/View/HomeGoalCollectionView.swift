//
//  HomeGoalCollectionView.swift
//  KeepGoEat-iOS
//
//  Created by 양정연 on 2023/01/07.
//

import UIKit

class HomeGoalCollectionView: UICollectionView {
    
    // MARK: - Variables
    let data = GetHomeResponse.setHomeDummy2()

    override init(frame: CGRect, collectionViewLayout layout: UICollectionViewLayout) {
        super.init(frame: frame, collectionViewLayout: layout)
        
        setRegister()
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
    
    @objc func achieveButtonDidTap(sender: UIButton) {
        guard let target = self.collectionView(self, cellForItemAt: IndexPath(item: sender.tag, section: 0)) as? HomeGoalCollectionViewCell else { return }
        let currentData = data.goals[sender.tag]
        print("✨", target.achieveButton)
        if currentData.isMore && currentData.isAchieved {
            target.achieveButton.setUI(kindType: .more, stateType: .before)
        } else if currentData.isMore && !currentData.isAchieved {
            target.achieveButton.setUI(kindType: .more, stateType: .after)
        } else if !currentData.isMore && currentData.isAchieved {
            target.achieveButton.setUI(kindType: .less, stateType: .before)
        } else {
            target.achieveButton.setUI(kindType: .less, stateType: .after)
        }
        target.updateCountLabel(count: 10)
        print("✨✨✨", target.achieveButton)
        reloadItems(at: [IndexPath(item: sender.tag, section: 0)])
    }
}

// MARK: - extension
// MARK: UICollectionViewDataSource
extension HomeGoalCollectionView: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let goalCell = collectionView.dequeueReusableCell(withReuseIdentifier: HomeGoalCollectionViewCell.identifier, for: indexPath) as? HomeGoalCollectionViewCell else { return UICollectionViewCell() }
        goalCell.databind(data: data.goals[indexPath.item])
        goalCell.achieveButton.tag = indexPath.item
        goalCell.achieveButton.addTarget(self, action: #selector(achieveButtonDidTap(sender: )), for: .touchUpInside)
        return goalCell
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return data.goalCount
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let goalCell = collectionView.dequeueReusableCell(withReuseIdentifier: HomeGoalCollectionViewCell.identifier, for: indexPath) as? HomeGoalCollectionViewCell else { return }
        print("✨상세뷰로 전환", goalCell)
    }
}

// MARK: UICollectionViewDelegateFlowLayout
extension HomeGoalCollectionView: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        if kind == UICollectionView.elementKindSectionFooter {
            guard let footerCell = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: HomeGoalCollectionReusableView.identifier, for: indexPath) as? HomeGoalCollectionReusableView else { return UICollectionViewCell() }
            footerCell.setSubTitleText(count: data.goalCount)
            return footerCell
        } else {
            return UICollectionReusableView()
        }
    }
}
