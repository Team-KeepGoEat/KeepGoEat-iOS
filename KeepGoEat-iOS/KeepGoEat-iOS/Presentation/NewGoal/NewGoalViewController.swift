//
//  NewGoalViewController.swift
//  KeepGoEat-iOS
//
//  Created by 양정연 on 2022/12/27.
//

import UIKit

import Then
import SnapKit

enum EatType: String {
    case more
    case less
}

class NewGoalViewController: BaseViewController {
    
    // MARK: - Variables
    private var eatType: EatType = .less {
        didSet {
            setUI()
        }
    }
    private var buttonEnable: Bool = false {
        didSet {
            setButtonUI()
        }
    }
    private var goalId: Int = 0
    
    private var isCreated: Bool = true
    
    // MARK: Component
    private let headerView: HeaderView = HeaderView()
    
    private let emptyView = UIView()
    
    private let emptyView2 = UIView()
    
    private let textMyGoalLabel = UILabel().then {
        $0.text = Const.String.textMyGoalTitle
        $0.textColor = .gray700
        $0.font = .system2Bold
    }
    
    private lazy var moreVegetabletextField = UITextField().then {
        $0.font = .system4Bold
        $0.delegate = self
        $0.setPlaceholder(color: .gray400)
        
        switch eatType {
        case .more:
            $0.placeholder = Const.String.moreEatPlaceHoleder
        case .less:
            $0.placeholder = Const.String.lessEatPlaceHoleder
        }
    }
    
    private let underLineLabel = UIView().then {
        $0.backgroundColor = .gray400
    }
    
    private let countTextLabel = UILabel().then {
        $0.text = Const.String.textCount
        $0.textColor = .gray400
        $0.font = .system5
    }
    
    private let GoalHederLabel = UILabel().then {
        $0.text = Const.String.GoalHeader
        $0.textColor = .gray700
        $0.font = .system4Bold
    }
    
    private lazy var moreEatLabel = UILabel().then {
        $0.textColor = .gray700
        $0.font = .system4Bold
        
        switch eatType {
        case .more:
            $0.text = Const.String.moreEat
        case .less:
            $0.text = Const.String.lessEat
        }
    }
    
    private let textMyGoalLabel2 = UILabel().then {
        $0.text = Const.String.textStandardTitle
        $0.textColor = .gray700
        $0.font = .system2Bold
    }
    
    private let fitStandardLabel = UILabel().then {
        $0.text = Const.String.textFitStandard
        $0.textColor = .gray600
        $0.font = .system5
    }
    
    private lazy var moreVegetabletextField2 = UITextField().then {
        $0.font = .system4Bold
        $0.delegate = self
        $0.setPlaceholder(color: .gray400)
        
        switch eatType {
        case .more:
            $0.placeholder = Const.String.detailEatTextField
        case .less:
            $0.placeholder = Const.String.detailEatTextField2
        }
    }
    
    private let underLineLabel2 = UIView().then {
        $0.backgroundColor = .gray400
    }
    
    private let countTextLabel2 = UILabel().then {
        $0.text = Const.String.textCount2
        $0.textColor = .gray400
        $0.font = .system5
    }
    
    private lazy var completeButton = UIButton().then {
        $0.setTitle(Const.String.complete, for: .normal)
        $0.titleLabel?.font = .system4Bold
        $0.setTitleColor(.gray400, for: .normal)
        $0.backgroundColor = .gray200
        $0.layer.cornerRadius = 8
        $0.isEnabled = false
    }
    
    private let warningLabel = UILabel().then {
        $0.text = Const.String.warning
        $0.textColor = .orange400
        $0.font = .system6
        $0.isHidden = true
    }
    
    private let warningLabel2 = UILabel().then {
        $0.text = Const.String.warning
        $0.textColor = .orange400
        $0.font = .system6
        $0.isHidden = true
    }
    
    private var bottomConstraint: NSLayoutConstraint?
    
    // MARK: - Function
    override func viewDidLoad() {
        super.viewDidLoad()
        layout()
        endEditingModeWhenUserTapOutside()
        setUI()
        setAddTarget()
        setDelegate()
        
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        moreVegetabletextField.becomeFirstResponder()
    }
    
    private func setUI() {
        view.backgroundColor = .white
        textMyGoalLabel.partColorChange(targetString: "*", textColor: .orange600)
    }
    
    private func layout() {
        view.addSubviews(
            headerView,
            emptyView,
            emptyView2,
            completeButton
        )
        
        headerView.addSubview(GoalHederLabel)
        
        [textMyGoalLabel, moreVegetabletextField, countTextLabel, moreEatLabel, underLineLabel, warningLabel ].forEach {
            emptyView.addSubview($0)
        }
        
        [textMyGoalLabel2, fitStandardLabel, moreVegetabletextField2, underLineLabel2, warningLabel2, countTextLabel2 ].forEach {
            emptyView2.addSubview($0)
        }
        
        headerView.snp.makeConstraints {
            $0.top.equalTo(self.view.safeAreaLayoutGuide)
            $0.leading.trailing.equalToSuperview()
            $0.centerX.equalToSuperview()
        }
        
        GoalHederLabel.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.centerY.equalToSuperview()
        }
        
        emptyView.snp.makeConstraints {
            $0.top.equalTo(self.view.safeAreaLayoutGuide).offset(72.adjusted)
            $0.width.equalTo(375.adjusted)
            $0.height.equalTo(200.adjusted)
            $0.centerX.equalToSuperview()
        }
        
        textMyGoalLabel.snp.makeConstraints {
            $0.top.equalTo(emptyView)
            $0.leading.equalToSuperview().offset(16.adjusted)
        }
        
        moreVegetabletextField.snp.makeConstraints {
            $0.top.equalTo(self.textMyGoalLabel.snp.bottom).offset(32.adjusted)
            $0.leading.equalTo(textMyGoalLabel)
        }
        
        underLineLabel.snp.makeConstraints {
            $0.top.equalTo(self.moreVegetabletextField.snp.bottom).offset(10.adjusted)
            $0.leading.equalTo(moreVegetabletextField)
            $0.height.equalTo(1.adjusted)
            $0.width.equalTo(343.adjusted)
        }
        
        countTextLabel.snp.makeConstraints {
            $0.top.equalTo(self.underLineLabel.snp.bottom).offset(8.adjusted)
            $0.trailing.equalToSuperview().offset(-16.adjusted)
        }
        
        warningLabel.snp.makeConstraints {
            $0.top.equalTo(self.underLineLabel.snp.bottom).offset(8.adjusted)
            $0.leading.equalTo(textMyGoalLabel)
        }
        
        moreEatLabel.snp.makeConstraints {
            $0.top.equalToSuperview().offset(54.adjusted)
            $0.trailing.equalTo(countTextLabel)
        }
        
        emptyView2.snp.makeConstraints {
            $0.top.equalTo(self.view.safeAreaLayoutGuide).offset(227.adjusted)
            $0.width.equalTo(375.adjusted)
            $0.height.equalTo(200.adjusted)
            $0.centerX.equalToSuperview()
        }
        
        textMyGoalLabel2.snp.makeConstraints {
            $0.top.equalTo(emptyView2)
            $0.leading.equalToSuperview().offset(16.adjusted)
        }
        
        fitStandardLabel.snp.makeConstraints {
            $0.top.equalTo(self.textMyGoalLabel2.snp.bottom).offset(8.adjusted)
            $0.leading.equalToSuperview().offset(16.adjusted)
        }
        
        moreVegetabletextField2.snp.makeConstraints {
            $0.top.equalTo(self.fitStandardLabel.snp.bottom).offset(20.adjusted)
            $0.leading.equalToSuperview().offset(16.adjusted)
        }
        
        underLineLabel2.snp.makeConstraints {
            $0.top.equalTo(self.moreVegetabletextField2.snp.bottom).offset(10.adjusted)
            $0.leading.equalTo(moreVegetabletextField2)
            $0.height.equalTo(1.adjusted)
            $0.width.equalTo(343.adjusted)
        }
        
        warningLabel2.snp.makeConstraints {
            $0.top.equalTo(self.underLineLabel2.snp.bottom).offset(8.adjusted)
            $0.leading.equalTo(textMyGoalLabel)
        }
        
        countTextLabel2.snp.makeConstraints {
            $0.top.equalTo(self.underLineLabel2.snp.bottom).offset(8.adjusted)
            $0.leading.equalTo(countTextLabel)
        }
        
        completeButton.snp.makeConstraints {
            $0.bottom.equalTo(view.safeAreaLayoutGuide).inset(44.adjusted)
            $0.centerX.equalToSuperview()
            $0.width.equalTo(343.adjusted)
            $0.height.equalTo(48.adjusted)
        }
    }
    
    private func setDelegate() {
        self.headerView.handleBackButtonDelegate = self
    }
    
    private func setAddTarget() {
        completeButton.addTarget(self, action: #selector(tapCompleteButton), for: .touchUpInside)
    }
    
    private func createGoal() {
        var check: Bool = true
        if eatType == .less {
            check = false
        }
        let body: NewGoalRequestDto = NewGoalRequestDto(
            food: moreVegetabletextField.text ?? "",
            criterion: moreVegetabletextField2.text ?? "",
            isMore: check
        )
        NewGoalService.shared.createNewGoal(body: body)
        let previousViewController = self.navigationController?.viewControllers.last { $0 != self }
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 0.1) {
            self.navigationController?.popViewController(animated: true)
            previousViewController!.makeToast(Const.String.createGoalToastMessage, withDuration: 1, delay: 1)
        }
    }
    
    private func editGoal() {
        let body: NewGoalEditRequestDto = NewGoalEditRequestDto(
            food: moreVegetabletextField.text ?? "",
            criterion: moreVegetabletextField2.text ?? ""
        )
        NewGoalService.shared.editNewGoal(body: body, param: goalId)
        let previousViewController = self.navigationController?.viewControllers.last { $0 != self }
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 0.1) {
            self.navigationController?.popViewController(animated: true)
            previousViewController!.makeToast(Const.String.editGoalToastMessage, withDuration: 1, delay: 1)
        }
    }
    
    @objc
    private func tapCompleteButton() {
        if isCreated {
            createGoal()
        } else {
            editGoal()
        }
    }
    
    func dataBind(goalId: Int?, eatType: EatType, content: String?, isCreated: Bool) {
        self.eatType = eatType
        self.isCreated = isCreated
        if let content = content {
            moreVegetabletextField.text = content
        }
        if let goalId = goalId {
            self.goalId = goalId
        }
    }
    
    func setButtonUI() {
        completeButton.backgroundColor = completeButton.isEnabled ? .orange600 : .gray200
        completeButton.setTitleColor(.gray400, for: .disabled)
        completeButton.setTitleColor(.gray50, for: .normal)
    }
}

extension NewGoalViewController: HandleBackButtonDelegate {
    func popView() {
        self.navigationController?.popViewController(animated: true)
    }
}

// MARK: - Extensions
extension UITextField {
    func setPlaceholder(color: UIColor) {
        guard let string = self.placeholder else {
            return
        }
        attributedPlaceholder = NSAttributedString(string: string, attributes: [.foregroundColor: color])
    }
}

// MARK: endEditingModeWhenUserTapOutside
extension NewGoalViewController {
    
    func endEditingModeWhenUserTapOutside() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(NewGoalViewController.endEditingView))
        self.view.addGestureRecognizer(tap)
    }
    
    // MARK: Objc Function
    @objc func endEditingView() {
        self.view.endEditing(true)
    }
    
    @objc private func keyboardWillShow(notification: NSNotification) {
        if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
            let keyboardHeight: CGFloat
            keyboardHeight = keyboardSize.height - self.view.safeAreaInsets.bottom
            completeButton.snp.updateConstraints {
                $0.bottom.equalTo(view.safeAreaLayoutGuide).inset(keyboardHeight + 16.adjusted)
            }
            self.view.layoutIfNeeded()
        }
    }
    
    @objc private func keyboardWillHide(notification: NSNotification) {
        completeButton.snp.updateConstraints {
            $0.bottom.equalTo(view.safeAreaLayoutGuide).inset(44.adjusted)
        }
        self.view.layoutIfNeeded()
    }
}

// MARK: UITextFieldDelegate
extension NewGoalViewController: UITextFieldDelegate {
    
    func textFieldDidChangeSelection(_ textField: UITextField) {
        if textField == moreVegetabletextField {
            textField.textColor = .gray700
            underLineLabel.backgroundColor = .orange600
            let textValue = textField.text ?? ""
            countTextLabel.text = "(\(textValue.count)/15)"
        } else if textField == moreVegetabletextField2 {
            textField.textColor = .gray700
            underLineLabel2.backgroundColor = .orange600
            let textValue = textField.text ?? ""
            countTextLabel2.text = "(\(textValue.count)/20)"
        }
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        if textField == moreVegetabletextField {
            underLineLabel.backgroundColor = .gray400
        } else { underLineLabel2.backgroundColor = .gray400 }
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if textField == moreVegetabletextField {
            let textValue = textField.text ?? ""
            guard let stringRange = Range(range, in: textValue) else { return false }
            let changedText = textValue.replacingCharacters(in: stringRange, with: string)
            warningLabel.isHidden = true
            
            // 글자수 15자 제한 백스페이스는 가능
            guard let text = textField.text else { return false }
            if text.count >= 15 {
                if let char = string.cString(using: String.Encoding.utf8) {
                    let isBackSpace = strcmp(char, "\\b")
                    if isBackSpace == -92 {
                        return true
                    }
                }
                return false
            }
            
            // 특수문자 사용 불가능
            if !changedText.hasCharacters() {
                warningLabel.isHidden = false
                warningLabel.text = Const.String.warning
//                completeButton.isEnabled = false
            }
            
            // 공백 사용 불가능
            if changedText.isEmpty {
                warningLabel.isHidden = false
                warningLabel.text = Const.String.emptyWarning
            }
            
            if changedText.isEmpty || !changedText.hasCharacters() {
                self.completeButton.isEnabled = false
                completeButton.backgroundColor = .gray200
                completeButton.setTitleColor(.gray400, for: .disabled)
            } else {
                self.completeButton.isEnabled = true
                completeButton.backgroundColor = .orange600
                completeButton.setTitleColor(.gray50, for: .normal)
            }
            return true
            
        } else if textField == moreVegetabletextField2 {
            let textValue = textField.text ?? ""
            guard let stringRange = Range(range, in: textValue) else { return false }
            let changedText = textValue.replacingCharacters(in: stringRange, with: string)
            warningLabel2.isHidden = true
            
            // 글자수 20자 제한 백스페이스는 가능
            guard let text = textField.text else { return false }
            if text.count >= 20 {
                if let char = string.cString(using: String.Encoding.utf8) {
                    let isBackSpace = strcmp(char, "\\b")
                    if isBackSpace == -92 {
                        return true
                    }
                }
                return false
            }
            
            // 특수문자 사용 불가능
            if !changedText.hasCharacters() {
                warningLabel2.isHidden = false
                warningLabel2.text = Const.String.warning
            }
            
            // 공백 사용 불가능
            if changedText.isEmpty {
                warningLabel2.isHidden = false
                warningLabel2.text = Const.String.emptyWarning
            }
        }
        return true
    }
}
