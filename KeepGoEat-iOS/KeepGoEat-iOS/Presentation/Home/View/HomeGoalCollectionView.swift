//
//  HomeGoalCollectionView.swift
//  KeepGoEat-iOS
//
//  Created by 양정연 on 2023/01/07.
//

import UIKit

import Mixpanel

protocol HandleCustomButtonDelegate: AnyObject {
    func showHomeBottomSheet()
    func playHomeLottie()
    func pushGoalDetail(goalId: Int)
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
            self.trackEvent(eventGroup: .completeGoal, gesture: .completed, eventProperty: .goal, data: [goal.food, goal.criterion])
            guard let data = data else { return }
            if data.updatedIsAchieved != goal.isAchieved {
                self.getHomeData()
            }
        }
    }
    private func getHomeData() {
        HomeService.shared.getHome { data in
            guard let data = data else { return }
            self.data = data
            self.reloadData()
        }
    }
    
    private func trackEvent(eventGroup: EventGroup, gesture: UserGesture, eventProperty: EventProperty?, data: [String]?) {
        let mixpanel = Mixpanel.mainInstance()
        let eventName = "\(eventGroup.rawValue) : \(gesture.rawValue)"
        
        if let propertyType = eventProperty, let data = data {
            trackEventProperty(eventName: eventName, type: propertyType, data: data)
        } else {
            mixpanel.track(event: eventName)
        }
    }
    
    private func trackEventProperty(eventName: String, type: EventProperty, data: [String]) {
        let mixpanel = Mixpanel.mainInstance()
        var propertyValue: Any?
        if data.count == 1 {
            propertyValue = data.first
        } else {
            propertyValue = data
        }
        mixpanel.track(event: eventName, properties: [type.rawValue: propertyValue])
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
            self.customButtonDelegate?.pushGoalDetail(goalId: data.goals[indexPath.item].goalId)
        } else {
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
