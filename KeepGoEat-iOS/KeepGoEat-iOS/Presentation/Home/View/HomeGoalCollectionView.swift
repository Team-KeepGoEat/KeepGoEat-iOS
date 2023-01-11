//
//  HomeGoalCollectionView.swift
//  KeepGoEat-iOS
//
//  Created by 양정연 on 2023/01/07.
//

import UIKit

protocol addGoalViewHandleDelegate: AnyObject {
    func showHomeBottomSheet()
}

class HomeGoalCollectionView: UICollectionView {
    
    // MARK: - Variables
    var data = gethomeDataList[2]
    weak var addGoalDelegate: addGoalViewHandleDelegate?

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
        self.register(HomeGoalAddCollectionViewCell.self, forCellWithReuseIdentifier: HomeGoalAddCollectionViewCell.identifier)
    }
    
    @objc func achieveButtonDidTap(sender: UIButton) {
        guard let target = self.collectionView(self, cellForItemAt: IndexPath(item: sender.tag, section: 0)) as? HomeGoalCollectionViewCell else { return }
        let currentData = data.goals[sender.tag]
        if currentData.isMore && currentData.isAchieved {
            target.achieveButton.isAchievedMore.toggle()
        } else if currentData.isMore && !currentData.isAchieved {
            target.achieveButton.isAchievedMore.toggle()
        } else if !currentData.isMore && currentData.isAchieved {
            target.achieveButton.isAchievedLess.toggle()
        } else {
            target.achieveButton.isAchievedLess.toggle()
        }
        target.updateCountLabel(count: 10)
        reloadItems(at: [IndexPath(item: sender.tag, section: 0)])
    }
}

// MARK: - extension
// MARK: UICollectionViewDataSource
extension HomeGoalCollectionView: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if indexPath.item < data.goalCount {
            guard let goalCell = collectionView.dequeueReusableCell(withReuseIdentifier: HomeGoalCollectionViewCell.identifier, for: indexPath) as? HomeGoalCollectionViewCell else { return UICollectionViewCell() }
            goalCell.databind(data: data.goals[indexPath.item])
            goalCell.achieveButton.tag = indexPath.item
            goalCell.achieveButton.addTarget(self, action: #selector(achieveButtonDidTap(sender: )), for: .touchUpInside)
            return goalCell
        } else {
            guard let footerCell = collectionView.dequeueReusableCell(withReuseIdentifier: HomeGoalAddCollectionViewCell.identifier, for: indexPath) as? HomeGoalAddCollectionViewCell else { return UICollectionViewCell() }
            footerCell.setSubTitleText(count: data.goals.count)
            return footerCell
        }
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return data.goalCount + 1
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if indexPath.item < data.goals.count {
            guard let goalCell = collectionView.dequeueReusableCell(withReuseIdentifier: HomeGoalCollectionViewCell.identifier, for: indexPath) as? HomeGoalCollectionViewCell else { return }
            print("✨상세뷰로 전환", goalCell)
        } else {
            guard let footerCell = collectionView.dequeueReusableCell(withReuseIdentifier: HomeGoalAddCollectionViewCell.identifier, for: indexPath) as? HomeGoalAddCollectionViewCell else { return }
            print("✨바텀시트 전환", footerCell)
            self.addGoalDelegate?.showHomeBottomSheet()
        }
    }
}

// MARK: UICollectionViewDelegateFlowLayout
extension HomeGoalCollectionView: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if indexPath.item < data.goals.count {
            return CGSize(width: 343.adjustedWidth, height: 184.adjusted)
        } else {
            return CGSize(width: 343.adjustedWidth, height: 82.adjusted)
        }
    }
}
