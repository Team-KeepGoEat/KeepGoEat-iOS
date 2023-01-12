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
    private var goalId: Int = 0
    
    private var isCreated: Bool = true
    
    // MARK: Component
    private let headerView: HeaderView = HeaderView()
    
    private let emptyView = UIView()
    
    private let textMyGoalLabel = UILabel().then {
        $0.text = Const.String.textMyGoalTitle
        $0.textColor = .gray700
        $0.font = .system2Bold
    }
    
    private lazy var moreVegetabletextField = UITextField().then {
        $0.placeholder = Const.String.moreVegetablePlaceHoleder
        $0.font = .system4Bold
        $0.delegate = self
        $0.becomeFirstResponder()
        $0.setPlaceholder(color: .gray400)
    }
    
    private let underLineLabel = UIView().then {
        $0.backgroundColor = .gray500
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
    
    private func setUI() {
        view.backgroundColor = .white
    }
    
    private func layout() {
        view.addSubviews(
            headerView,
            emptyView,
            completeButton
        )
        
        headerView.addSubview(GoalHederLabel)
        
        [textMyGoalLabel, moreVegetabletextField, countTextLabel, moreEatLabel, underLineLabel, warningLabel ].forEach {
            emptyView.addSubview($0)
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
            $0.leading.equalToSuperview().offset(20.adjusted)
        }
        
        moreVegetabletextField.snp.makeConstraints {
            $0.top.equalTo(self.textMyGoalLabel.snp.bottom).offset(32.adjusted)
            $0.leading.equalTo(textMyGoalLabel)
        }
        
        underLineLabel.snp.makeConstraints {
            $0.top.equalTo(self.moreVegetabletextField.snp.bottom).offset(10.adjusted)
            $0.leading.equalTo(moreVegetabletextField)
            $0.height.equalTo(1.adjusted)
            $0.width.equalTo(273.adjusted)
        }
        
        countTextLabel.snp.makeConstraints {
            $0.top.equalTo(self.underLineLabel.snp.bottom).offset(8.adjusted)
            $0.leading.equalTo(textMyGoalLabel)
        }
        
        warningLabel.snp.makeConstraints {
            $0.top.equalTo(self.countTextLabel.snp.bottom).offset(12.adjusted)
            $0.leading.equalTo(textMyGoalLabel)
        }
        
        moreEatLabel.snp.makeConstraints {
            $0.top.equalToSuperview().offset(54.adjusted)
            $0.leading.equalTo(self.underLineLabel.snp.trailing).offset(16.adjusted)
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
            goalContent: moreVegetabletextField.text ?? "",
            isMore: check
        )
        NewGoalService.shared.createNewGoal(body: body)
    }
    
    private func editGoal() {
        let body: NewGoalEditRequestDto = NewGoalEditRequestDto(
            goalContent: moreVegetabletextField.text ?? ""
        )
        NewGoalService.shared.editNewGoal(body: body, param: goalId)
        self.navigationController?.popViewController(animated: true)
    }
    
    @objc
    private func tapCompleteButton() {
        if isCreated {
            createGoal()
            self.navigationController?.popToRootViewController(animated: true)
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
    
    func textFieldDidBeginEditing(_ textView: UITextField) {
        if let text = textView.text, text.isEmpty {
            textView.textColor = .gray700
        }
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let cuerrentText = textField.text ?? ""
        guard let stringRange = Range(range, in: cuerrentText) else { return false }
        let changedText = cuerrentText.replacingCharacters(in: stringRange, with: string)
        
        if changedText.isEmpty {
            self.completeButton.isEnabled = false
            completeButton.backgroundColor = .gray200
            completeButton.setTitleColor(.gray400, for: .disabled)
        } else {
            self.completeButton.isEnabled = true
            completeButton.backgroundColor = .orange600
            completeButton.setTitleColor(.gray50, for: .normal)
        }
        
        countTextLabel.text = "(\(changedText.count)/20)"
        
        func searchPressed(_ sender: UIButton) {
            moreVegetabletextField.endEditing(true)
        }
        
        func textFieldShouldReturn(_ textField: UITextField) -> Bool {
            moreVegetabletextField.endEditing(true)
            print(moreVegetabletextField.text!)
            return true
        }
        
        if !string.hasCharacters() {
            warningLabel.isHidden = false
        }
        
        if changedText.hasCharacters() {
            warningLabel.isHidden = true
        }
        
        return (changedText.count <= 19)
    }
}
