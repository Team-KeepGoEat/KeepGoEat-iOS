//
//  HomeGoalCollectionView.swift
//  KeepGoEat-iOS
//
//  Created by 양정연 on 2023/01/07.
//

import UIKit

protocol HandleCustomButtonDelegate: AnyObject {
    func showHomeBottomSheet()
    func playHomeLottie()
}

class HomeGoalCollectionView: UICollectionView {
    
    // MARK: - Variables
    var data = gethomeDataList[2]
    weak var customButtonDelegate: HandleCustomButtonDelegate?
    
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
    private func postAchieveGoal(goal: Goal) {
        HomeService.shared.postAchieveGoal(body: PostGoalAchieveRequest(isAchieved: !goal.isAchieved), param: goal.goalId) { data in
            guard let data = data else { return }
            if data.updatedIsAchieved != goal.isAchieved {
                self.getHomeData()
            }
        }
    }
    private func getHomeData() {
        HomeService.shared.getHome() { data in
            guard let data = data else { return }
            self.data = data
            self.reloadData()
        }
    }
    
    @objc func achieveButtonDidTap(sender: UIButton) {
        let currentGoal = data.goals[sender.tag]
        self.postAchieveGoal(goal: currentGoal)
        if currentGoal.isAchieved == false {
            self.customButtonDelegate?.playHomeLottie()
        }
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
            self.customButtonDelegate?.showHomeBottomSheet()
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
