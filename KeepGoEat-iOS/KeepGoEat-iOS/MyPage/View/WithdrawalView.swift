//
//  WithdrawView.swift
//  KeepGoEat-iOS
//
//  Created by 정채은 on 2023/03/06.
//

import UIKit

import SnapKit
import Then

class WithdrawalView: UIView {
    // MARK: Component
    
    private let headerView: HeaderView = HeaderView()
    
    private let headerViewTitle = UILabel().then {
        $0.text = Const.String.withdrawal
        $0.textColor = .gray800
        $0.font = .system4Bold
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
        $0.textContainerInset = UIEdgeInsets(top: 12, left: 16, bottom: 16, right: 12)
        $0.borderColor = .gray200
        $0.borderWidth = 1
    
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
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
//    @objc func checkBoxButtonTapped(_ sender: UIButton) {
//        sender.isSelected = !sender.isSelected
//        // 선택 여부에 따라 UILabel 폰트 변경
//        checkBoxTitle.font = sender.isSelected ? UIFont.boldSystemFont(ofSize: 16) : UIFont.systemFont(ofSize: 16)
//    }
}

extension WithdrawalView {
    
    private func setUI() {
        self.backgroundColor = .white
    }
    private func setLayout() {
        self.addSubviews(
            headerView,
            withdrawalTitle,
            withdrawalDescription,
            stopEatButton,
            notUseCheckBox,
            errorCheckBox,
            badContentsCheckBox,
            manualInputCheckBox,
            manualInputMessage,
            manualInputTextView,
            withdrawalConfirmButton
        )
        
        headerView.addSubviews(
            headerViewTitle
        )
        
        headerView.snp.makeConstraints{
            $0.top.equalTo(self.safeAreaLayoutGuide)
            $0.horizontalEdges.equalTo(self.safeAreaLayoutGuide)
            $0.height.equalTo(48.adjusted)
        }
        
        headerViewTitle.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.centerX.equalToSuperview()
        }
        withdrawalTitle.snp.makeConstraints{
            $0.top.equalTo(headerView.snp.bottom).offset(24.adjusted)
            $0.leading.equalTo(16.adjusted)
        }
        withdrawalDescription.snp.makeConstraints{
            $0.top.equalTo(withdrawalTitle.snp.bottom).offset(4.adjusted)
            $0.leading.equalTo(withdrawalTitle)
        }
        stopEatButton.snp.makeConstraints{
            $0.top.equalTo(withdrawalDescription.snp.bottom).offset(16.adjusted)
            $0.leading.equalTo(withdrawalTitle)
        }
        notUseCheckBox.snp.makeConstraints{
            $0.top.equalTo(stopEatButton.snp.bottom).offset(24.adjusted)
            $0.leading.equalTo(withdrawalTitle)
        }
        errorCheckBox.snp.makeConstraints{
            $0.top.equalTo(notUseCheckBox.snp.bottom).offset(24.adjusted)
            $0.leading.equalTo(withdrawalTitle)
        }
        badContentsCheckBox.snp.makeConstraints{
            $0.top.equalTo(errorCheckBox.snp.bottom).offset(24.adjusted)
            $0.leading.equalTo(withdrawalTitle)
        }
        manualInputCheckBox.snp.makeConstraints{
            $0.top.equalTo(badContentsCheckBox.snp.bottom).offset(24.adjusted)
            $0.leading.equalTo(withdrawalTitle)
        }
        manualInputTextView.snp.makeConstraints{
            $0.top.equalTo(manualInputCheckBox.snp.bottom).offset(8.adjusted)
            $0.centerX.equalToSuperview()
            $0.leading.trailing.equalTo(withdrawalTitle)
            $0.height.equalTo(104.adjusted)
        }
        manualInputMessage.snp.makeConstraints{
            $0.top.equalTo(manualInputTextView.snp.bottom).offset(8.adjusted)
            $0.leading.equalTo(20.adjusted)
        }
        withdrawalConfirmButton.snp.makeConstraints{
            $0.bottom.equalToSuperview().offset(-44.adjusted)
            $0.centerX.equalToSuperview()
            $0.leading.trailing.equalTo(withdrawalTitle)
            $0.height.equalTo(48.adjusted)
        }
        
    }
    
    private func setAddTarget() {
//        checkBoxButton.addTarget(self, action: #selector(checkBoxButtonTapped(_:)), for: .touchUpInside)
    }
}
