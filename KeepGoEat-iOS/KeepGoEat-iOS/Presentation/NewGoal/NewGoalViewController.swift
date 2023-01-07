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

class NewGoalViewController: UIViewController {
    
    // MARK: - Variables
    private let eatType: EatType = .less
    
    // MARK: Component
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
        
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    private func layout() {
        view.backgroundColor = .white
        [textMyGoalLabel, moreVegetabletextField, countTextLabel, moreEatLabel, underLineLabel, warningLabel, completeButton].forEach {
            view.addSubview($0)
        }
        
        textMyGoalLabel.snp.makeConstraints {
            $0.top.equalToSuperview().offset(92.adjusted)
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
            $0.top.equalToSuperview().offset(146.adjusted)
            $0.leading.equalTo(self.underLineLabel.snp.trailing).offset(16.adjusted)
        }
        
        completeButton.snp.makeConstraints {
            $0.bottom.equalToSuperview().inset(52.adjusted)
            $0.centerX.equalToSuperview()
            $0.width.equalTo(343.adjusted)
            $0.height.equalTo(48.adjusted)
        }
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
                $0.bottom.equalToSuperview().inset(keyboardHeight + 16)
            }
            self.view.layoutIfNeeded()
        }
    }

    @objc private func keyboardWillHide(notification: NSNotification) {
        completeButton.snp.updateConstraints {
            $0.bottom.equalToSuperview().inset(52)
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
