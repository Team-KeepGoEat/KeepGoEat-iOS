//
//  WithdrawalView.swift
//  KeepGoEat-iOS
//
//  Created by 정채은 on 2023/03/06.
//

import UIKit

import SnapKit
import Then

class WithdrawalView: UIView, UITextViewDelegate {
    
    // MARK: Component
    
    let headerView: HeaderView = HeaderView()
    
    private let headerViewTitle = UILabel().then {
        $0.text = Const.String.withdrawal
        $0.textColor = .gray800
        $0.font = .system4Bold
    }
    
    private let withdrawalScrollView = UIScrollView().then {
        $0.keyboardDismissMode = .interactive
        $0.contentInsetAdjustmentBehavior = .always
    }
    
    private let withdrawalTitle = UILabel().then {
        $0.text = Const.String.withdrawalTitle
        $0.textColor = .gray800
        $0.font = .system2Bold
    }
    
    private let withdrawalDescription = UILabel().then {
        $0.text = Const.String.withdrawalDescription
        $0.textColor = .gray600
        $0.font = .system5
    }
    
    private let stopEatButton = CheckBoxButton().then {
        $0.label.text = Const.String.stopEatCheckBox
    }
    
    private let notUseCheckBox = CheckBoxButton().then {
        $0.label.text = Const.String.notUseCheckBox
    }
    
    private let errorCheckBox = CheckBoxButton().then {
        $0.label.text = Const.String.errorCheckBox
    }
    
    private let badContentsCheckBox = CheckBoxButton().then {
        $0.label.text = Const.String.badContentsCheckBox
    }
    
    private let manualInputCheckBox = CheckBoxButton().then {
        $0.label.text = Const.String.manualInputCheckBox
    }
    
    private let manualInputTextView = UITextView().then {
        $0.textContainerInset = UIEdgeInsets(top: 12.adjusted, left: 16.adjusted, bottom: 16.adjusted, right: 12.adjusted)
        $0.borderColor = .gray200
        $0.borderWidth = 1
        $0.isEditable = false
        if $0.text.isEmpty {
            $0.text = Const.String.manualInputDescription
            $0.font = .system5
            $0.textColor = .gray400
        }
        $0.contentMode = .top
    }
    
    private let manualInputMessage = UILabel().then {
        $0.text = Const.String.manualInputMessage
        $0.textColor = .orange400
        $0.font = .system6
        $0.isHidden = true
    }
    
    private let withdrawalConfirmButton = UIButton().then {
        $0.setTitle(Const.String.withdrawal, for: .normal)
        $0.titleLabel?.font = .system4Bold
        $0.setTitleColor(.gray50, for: .normal)
        $0.backgroundColor = .orange600
        $0.layer.cornerRadius = 8.adjusted
    }
    
    // MARK: LifeCycle
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUI()
        setLayout()
        setAddTarget()
        manualInputTextView.delegate = self
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
    
extension WithdrawalView {
    
    func textViewDidBeginEditing(_ textView: UITextView) {
        if textView == manualInputTextView {
            withdrawalScrollView.scrollRectToVisible(manualInputTextView.frame, animated: true)
            textView.borderColor = .orange600
        }
        if textView.textColor == .gray400 {
            textView.text = nil
            textView.textColor = .gray800
            textView.font = .system5
        }
    }
        
    func textViewDidEndEditing(_ textView: UITextView) {
        if textView == manualInputTextView {
            textView.borderColor = .gray200
        }
        if textView.text.isEmpty {
            textView.text = Const.String.manualInputDescription
            textView.font = .system5
            textView.textColor = .gray400
        }
    }
    func textViewDidChange(_ textView: UITextView) {
        if !manualInputMessage.isHidden && !textView.text.isEmpty {
            manualInputMessage.isHidden = true
        }
    }
    
    private func setUI() {
        self.backgroundColor = .white
    }
    
    private func setLayout() {
        self.addSubviews(
            headerView,
            withdrawalTitle,
            withdrawalDescription,
            withdrawalScrollView,
            withdrawalConfirmButton
        )
        
        headerView.addSubviews(
            headerViewTitle
        )
        
        withdrawalScrollView.addSubviews(
            stopEatButton,
            notUseCheckBox,
            errorCheckBox,
            badContentsCheckBox,
            manualInputCheckBox,
            manualInputMessage,
            manualInputTextView
        )
        
        withdrawalScrollView.snp.makeConstraints {
            $0.top.equalTo(withdrawalDescription.snp.bottom)
            $0.bottom.leading.trailing.equalTo(self.safeAreaLayoutGuide)
        }
        
        headerView.snp.makeConstraints {
            $0.top.equalTo(self.safeAreaLayoutGuide)
            $0.horizontalEdges.equalTo(self.safeAreaLayoutGuide)
            $0.height.equalTo(48.adjusted)
        }
        
        headerViewTitle.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.centerX.equalToSuperview()
        }
        
        withdrawalTitle.snp.makeConstraints {
            $0.top.equalTo(headerView.snp.bottom).offset(24.adjusted)
            $0.leading.equalTo(16.adjusted)
        }
        
        withdrawalDescription.snp.makeConstraints {
            $0.top.equalTo(withdrawalTitle.snp.bottom).offset(4.adjusted)
            $0.leading.equalTo(withdrawalTitle)
        }
        
        stopEatButton.snp.makeConstraints {
            $0.top.equalTo(withdrawalDescription.snp.bottom).offset(16.adjusted)
            $0.leading.equalTo(withdrawalTitle)
        }
        
        notUseCheckBox.snp.makeConstraints {
            $0.top.equalTo(stopEatButton.snp.bottom).offset(24.adjusted)
            $0.leading.equalTo(withdrawalTitle)
        }
        
        errorCheckBox.snp.makeConstraints {
            $0.top.equalTo(notUseCheckBox.snp.bottom).offset(24.adjusted)
            $0.leading.equalTo(withdrawalTitle)
        }
        
        badContentsCheckBox.snp.makeConstraints {
            $0.top.equalTo(errorCheckBox.snp.bottom).offset(24.adjusted)
            $0.leading.equalTo(withdrawalTitle)
        }
        
        manualInputCheckBox.snp.makeConstraints {
            $0.top.equalTo(badContentsCheckBox.snp.bottom).offset(24.adjusted)
            $0.leading.equalTo(withdrawalTitle)
        }
        
        manualInputTextView.snp.makeConstraints {
            $0.top.equalTo(manualInputCheckBox.snp.bottom).offset(8.adjusted)
            $0.centerX.equalToSuperview()
            $0.leading.trailing.equalTo(withdrawalTitle)
            $0.height.equalTo(104.adjusted)
        }
        
        manualInputMessage.snp.makeConstraints {
            $0.top.equalTo(manualInputTextView.snp.bottom).offset(8.adjusted)
            $0.leading.equalTo(20.adjusted)
        }
        
        withdrawalConfirmButton.snp.makeConstraints {
            $0.bottom.equalToSuperview().offset(-44.adjusted)
            $0.centerX.equalToSuperview()
            $0.leading.trailing.equalTo(withdrawalTitle)
            $0.height.equalTo(48.adjusted)
        }
    }
    
    private func setAddTarget() {
        manualInputCheckBox.addTarget(self, action: #selector(manualInputCheckBoxTapped), for: .touchUpInside)
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        self.addGestureRecognizer(tapGesture)
        withdrawalConfirmButton.addTarget(self, action: #selector(withdrawalConfirmButtonDidTap), for: .touchUpInside)
    }
    
    @objc func dismissKeyboard() {
        self.endEditing(true)
    }
    
    @objc private func withdrawalConfirmButtonDidTap(_ sender: UIButton, _ textView: UITextView) {
        let textView = manualInputTextView
        if ( textView.text.isEmpty || textView.textColor == .gray400 ) && manualInputCheckBox.isSelected {
            manualInputMessage.isHidden = false
        } else {
            manualInputMessage.isHidden = true
            let withdrawalAlertView = WithdrawalAlertView()
            self.addSubview(withdrawalAlertView)
            withdrawalAlertView.snp.makeConstraints {
                $0.edges.equalToSuperview()
            }
            withdrawalAlertView.showAlert()
        }
    }
    
    @objc private func manualInputCheckBoxTapped() {
        manualInputCheckBox.isSelected = !manualInputCheckBox.isSelected
        
        if manualInputCheckBox.isSelected {
            manualInputTextView.isEditable = true
            manualInputTextView.becomeFirstResponder()
        } else {
            manualInputTextView.isEditable = false
            manualInputTextView.resignFirstResponder()
            if !manualInputMessage.isHidden {
                manualInputMessage.isHidden = true
            }
        }
        print(manualInputCheckBox.isSelected)
    }
}
