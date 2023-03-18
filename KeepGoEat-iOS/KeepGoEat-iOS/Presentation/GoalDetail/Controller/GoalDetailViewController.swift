//
//  GoalDetailViewController.swift
//  KeepGoEat-iOS
//
//  Created by 양정연 on 2022/12/27.
//

import UIKit

class GoalDetailViewController: BaseViewController {
    
    // MARK: Varialbes
    private var goalId: Int = 0
    
    private var data: GoalDetailResponseDto = GoalDetailResponseDto(
        goalId: 0,
        isMore: true,
        thisMonthCount: 0,
        lastMonthCount: 0,
        goalContent: "테스트",
        blankBoxCount: 0,
        emptyBoxCount: 0
    )
    
    private let goalDetailView: GoalDetailView = GoalDetailView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setAddTarget()
        setupGestureRecognizer()
        setDelegate()
    }
    
    override func loadView() {
        self.view = goalDetailView
    }
    
    override func viewWillAppear(_ animated: Bool) {
        getGoalDetailData()
        navigationController?.setNavigationBarHidden(true, animated: true)
    }
}

extension GoalDetailViewController {
    private func setAddTarget() {
        goalDetailView.saveGoalButton.addTarget(self, action: #selector(tapSaveGoalButton), for: .touchUpInside)
        goalDetailView.saveBottomSheetView.bottomSheetDeleteButton.addTarget(self, action: #selector(tapDeleteGoalButton), for: .touchUpInside)
        goalDetailView.deleteBottomSheetView.cancelButton.addTarget(self, action: #selector(tapCancelButton), for: .touchUpInside)
        goalDetailView.editGoalButton.addTarget(self, action: #selector(editButtonDidTap), for: .touchUpInside)
        goalDetailView.deleteBottomSheetView.deleteButton.addTarget(self, action: #selector(deleteButtonDidTap), for: .touchUpInside)
        goalDetailView.saveBottomSheetView.bottomSheetSaveButton.addTarget(self, action: #selector(saveButtonDidTap), for: .touchUpInside)
    }
    
    private func setupGestureRecognizer() {
        let dimmedTap = UITapGestureRecognizer(target: self, action: #selector(dimmedViewTapped(_: )))
        goalDetailView.dimmedView.addGestureRecognizer(dimmedTap)
        goalDetailView.dimmedView.isUserInteractionEnabled = true
    }
    
    private func setDelegate() {
//        goalDetailView.saveBottomSheetView.handleSaveGoalButtonDelegate = self
        goalDetailView.headerView.handleBackButtonDelegate = self
    }
    
    private func saveGoal() {
        GoalDetailService.shared.saveGoal(goalId: goalId)
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 0.1) {
            let storeGoalViewController = StoreGoalViewController()
            guard let rootViewController = self.navigationController?.viewControllers.first as? UIViewController else { return }
            self.navigationController?.popToRootViewController(animated: false)
            
            storeGoalViewController.makeToast(Const.String.saveGoalToastMessage, withDuration: 1, delay: 1)
            rootViewController.navigationController?.pushViewController(storeGoalViewController, animated: false)
        }
    }
    
    @objc
    private func saveButtonDidTap() {
        saveGoal()
    }
    
    private func getGoalDetailData() {
        GoalDetailService.shared.getGoalDetail(goalId: goalId) { data in
            if let data = data {
                DispatchQueue.main.async {
                    if data.isMore {
                        self.goalDetailView.goalType = .more
                        self.goalDetailView.goalTitleLabel.text = data.goalContent + " \(Const.String.moreEat)"
                    } else {
                        self.goalDetailView.goalType = .less
                        self.goalDetailView.goalTitleLabel.text = data.goalContent + " \(Const.String.lessEat)"
                    }
                    self.data = data
                    self.goalDetailView.previousGoalStatsView.goalStatsCountLabel.text = String(data.lastMonthCount)
                    self.goalDetailView.presentGoalStatsView.goalStatsCountLabel.text = String(data.thisMonthCount)
                    
                    self.goalDetailView.goalStatsCollectionView.thisMonthCount = data.thisMonthCount
                    self.goalDetailView.goalStatsCollectionView.blankBoxCount = data.blankBoxCount
                    self.goalDetailView.goalStatsCollectionView.emptyBoxCount = data.emptyBoxCount
                }
            }
        }
    }
    
    private func deleteGoal() {
        GoalDetailService.shared.deleteGoal(goalId: self.goalId) { _ in }
    }
    
    @objc
    private func deleteButtonDidTap() {
        deleteGoal()
        guard let previousViewController = self.navigationController?.viewControllers.first as? UIViewController else { return }
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 0.1) {
            self.navigationController?.popViewController(animated: true)
            previousViewController.makeToast(Const.String.deleteGoalToastMessage, withDuration: 1, delay: 1)
        }
    }
    
    private func showSaveBottomSheetView() {
        goalDetailView.saveBottomSheetView.isHidden = false
        goalDetailView.deleteBottomSheetView.isHidden = true
    }
    
    private func showDeleteBottomSheetView() {
        goalDetailView.saveBottomSheetView.isHidden = true
        goalDetailView.deleteBottomSheetView.isHidden = false
    }
    
    func setGoalId(id: Int) {
        self.goalId = id
    }
    
    @objc
    private func editButtonDidTap() {
        let newGoalViewController = NewGoalViewController()
        if data.isMore {
            newGoalViewController.dataBind(goalId: data.goalId, eatType: .more, content: data.goalContent, isCreated: false)
        } else {
            newGoalViewController.dataBind(goalId: data.goalId, eatType: .less, content: data.goalContent, isCreated: false)
        }
        self.navigationController?.pushViewController(newGoalViewController, animated: true)
    }
    
    @objc
    private func tapCancelButton() {
        showSaveBottomSheetView()
    }
    
    @objc
    private func tapDeleteGoalButton() {
        showDeleteBottomSheetView()
    }
    
    @objc
    private func tapSaveGoalButton() {
        self.showBottomSheet(bottomSheetView: goalDetailView.bottomSheetView, dimmedView: goalDetailView.dimmedView)
    }
    
    // UITapGestureRecognizer 연결 함수 부분
    @objc private func dimmedViewTapped(_ tapRecognizer: UITapGestureRecognizer) {
        self.hideBottomSheet(bottomSheetView: goalDetailView.bottomSheetView, dimmedView: goalDetailView.dimmedView)
        goalDetailView.saveBottomSheetView.isHidden = false
        goalDetailView.deleteBottomSheetView.isHidden = true
    }
}

//extension GoalDetailViewController: HandleSaveGoalButtonDelegate {
//    func pushStoreGoal() {
//        guard let rootViewController = navigationController?.viewControllers[0] as? UIViewController else { return }
//        self.navigationController?.popToRootViewController(animated: false)
//        rootViewController.navigationController?.pushViewController(StoreGoalViewController(), animated: false)
//    }
//}

extension GoalDetailViewController: HandleBackButtonDelegate {
    func popView() {
        self.navigationController?.popViewController(animated: true)
    }
}
