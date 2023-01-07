//
//  GoalDetailViewController.swift
//  KeepGoEat-iOS
//
//  Created by 양정연 on 2022/12/27.
//

import UIKit

class GoalDetailViewController: UIViewController {
    
    private let goalDetailView: GoalDetailView = GoalDetailView(frame: CGRect(), goalType: .more)

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setAddTarget()
        setupGestureRecognizer()
    }
    
    override func loadView() {
        self.view = goalDetailView
    }
}

extension GoalDetailViewController {
    private func setAddTarget() {
        goalDetailView.saveGoalButton.addTarget(self, action: #selector(tapSaveGoalButton), for: .touchUpInside)
        goalDetailView.saveBottomSheetView.bottomSheetDeleteButton.addTarget(self, action: #selector(tapDeleteGoalButton), for: .touchUpInside)
        goalDetailView.deleteBottomSheetView.cancelButton.addTarget(self, action: #selector(tapCancelButton), for: .touchUpInside)
    }
    
    private func setupGestureRecognizer() {
            let dimmedTap = UITapGestureRecognizer(target: self, action: #selector(dimmedViewTapped(_: )))
        goalDetailView.dimmedView.addGestureRecognizer(dimmedTap)
        goalDetailView.dimmedView.isUserInteractionEnabled = true
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
