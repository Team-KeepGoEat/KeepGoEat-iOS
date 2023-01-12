//
//  GoalDetailViewController.swift
//  KeepGoEat-iOS
//
//  Created by 양정연 on 2022/12/27.
//

import UIKit

class GoalDetailViewController: BaseViewController {
    
    // MARK: Varialbes
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
    }
}

extension GoalDetailViewController {
    private func setAddTarget() {
        goalDetailView.saveGoalButton.addTarget(self, action: #selector(tapSaveGoalButton), for: .touchUpInside)
        goalDetailView.saveBottomSheetView.bottomSheetDeleteButton.addTarget(self, action: #selector(tapDeleteGoalButton), for: .touchUpInside)
        goalDetailView.deleteBottomSheetView.cancelButton.addTarget(self, action: #selector(tapCancelButton), for: .touchUpInside)
        goalDetailView.editGoalButton.addTarget(self, action: #selector(editButtonDidTap), for: .touchUpInside)
    }
    
    private func setupGestureRecognizer() {
            let dimmedTap = UITapGestureRecognizer(target: self, action: #selector(dimmedViewTapped(_: )))
        goalDetailView.dimmedView.addGestureRecognizer(dimmedTap)
        goalDetailView.dimmedView.isUserInteractionEnabled = true
    }
    
    private func setDelegate() {
        goalDetailView.saveBottomSheetView.handleSaveGoalButtonDelegate = self
        goalDetailView.headerView.handleBackButtonDelegate = self
    }
    
    private func getGoalDetailData() {
        GoalDetailService.shared.getGoalDetail(goalId: 50) { data in
            if let data = data {
                DispatchQueue.main.async {
                    if data.isMore {
                        self.goalDetailView.goalType = .more
                    } else {
                        self.goalDetailView.goalType = .less
                    }
                    self.goalDetailView.goalTitleLabel.text = data.goalContent
                    self.goalDetailView.previousGoalStatsView.goalStatsCountLabel.text = String(data.lastMonthCount)
                    self.goalDetailView.presentGoalStatsView.goalStatsCountLabel.text = String(data.thisMonthCount)
                    self.goalDetailView.goalStatsCollectionView.thisMonthCount = data.thisMonthCount
                    self.goalDetailView.goalStatsCollectionView.blankBoxCount = data.blankBoxCount
                    self.goalDetailView.goalStatsCollectionView.emptyBoxCount = data.emptyBoxCount
                    
                    self.data = data
                }
            }
        }
        makeToast("목표 조회 성공", withDuration: 1, delay: 1)
    }
    
    private func showSaveBottomSheetView() {
        goalDetailView.saveBottomSheetView.isHidden = false
        goalDetailView.deleteBottomSheetView.isHidden = true
    }
    
    private func showDeleteBottomSheetView() {
        goalDetailView.saveBottomSheetView.isHidden = true
        goalDetailView.deleteBottomSheetView.isHidden = false
    }
    
    @objc
    private func editButtonDidTap() {
        let newGoalViewController = NewGoalViewController()
        if data.isMore {
            newGoalViewController.dataBind(eatType: .more, content: data.goalContent)
        } else {
            newGoalViewController.dataBind(eatType: .less, content: data.goalContent)
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

extension GoalDetailViewController: HandleSaveGoalButtonDelegate {
    func pushStoreGoal() {
        self.navigationController?.pushViewController(StoreGoalViewController(), animated: false)
    }
}

extension GoalDetailViewController: HandleBackButtonDelegate {
    func popView() {
        self.navigationController?.popViewController(animated: true)
    }
}
