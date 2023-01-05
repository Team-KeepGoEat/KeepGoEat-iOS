//
//  NewGoalViewController.swift
//  KeepGoEat-iOS
//
//  Created by 양정연 on 2022/12/27.
//

import UIKit

import Then
import SnapKit

final class NewGoalViewController: UIViewController {
    
    // MARK: Component
    private let textMyGoalLabel = UILabel().then {
        $0.text = "나의 목표를 입력해볼까요?"
        $0.textColor = .gray700
        $0.font = .system2Bold
    }
    
    private lazy var moreVegetabletextField = UITextField().then {
        $0.placeholder = "ex) 하루 1끼 이상 야채"
        $0.font = .system4Bold
        $0.textColor = .gray400
        $0.delegate = self
        $0.becomeFirstResponder()
    }

    private let underLineLabel = UIView().then {
        $0.backgroundColor = .gray500
    }
    
    private let countTextLabel = UILabel().then {
        $0.text = "(0/20)"
        $0.textColor = .gray400
        $0.font = .system5
    }
    
    private let moreEatLabel = UILabel().then {
        $0.text = "더먹기"
        $0.textColor = .gray700
        $0.font = .system4Bold
    }
    
    private lazy var completeButton = UIButton().then {
        $0.setTitle("완료", for: .normal)
        $0.titleLabel?.font = .system4Bold
        $0.setTitleColor(.gray400, for: .normal)
        $0.backgroundColor = .gray200
        $0.layer.cornerRadius = 8
        $0.isEnabled = false
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
    
//    override func viewWillAppear(_ animated: Bool) {
//        addKeyboardNotification()
//    }
    
    private func layout() {
        view.backgroundColor = .white
        [textMyGoalLabel, moreVegetabletextField, countTextLabel, moreEatLabel, underLineLabel, completeButton].forEach {
            view.addSubview($0)
        }
        
        textMyGoalLabel.snp.makeConstraints {
            $0.top.equalToSuperview().offset(92)
            $0.leading.equalToSuperview().offset(20)
        }
        
        moreVegetabletextField.snp.makeConstraints {
            $0.top.equalTo(self.textMyGoalLabel.snp.bottom).offset(32)
            $0.leading.equalTo(textMyGoalLabel)
        }
        
        underLineLabel.snp.makeConstraints {
            $0.top.equalTo(self.moreVegetabletextField.snp.bottom).offset(10)
            $0.leading.equalTo(moreVegetabletextField)
            $0.height.equalTo(1)
            $0.width.equalTo(273)
        }
        
        countTextLabel.snp.makeConstraints {
            $0.top.equalTo(self.underLineLabel.snp.bottom).offset(8)
            $0.leading.equalTo(textMyGoalLabel)
        }
        
        moreEatLabel.snp.makeConstraints {
            $0.top.equalToSuperview().offset(146)
            $0.leading.equalTo(self.underLineLabel.snp.trailing).offset(16)
        }
        
        completeButton.snp.makeConstraints {
            $0.bottom.equalToSuperview().inset(52)
            $0.centerX.equalToSuperview()
            $0.width.equalTo(343)
            $0.height.equalTo(48)
        }
        
        let safeArea = self.view.safeAreaLayoutGuide

//        self.bottomConstraint = NSLayoutConstraint(item: self.textMyGoalLabel, attribute: .bottom, relatedBy: .equal, toItem: safeArea, attribute: .bottom, multiplier: 1.0, constant: 0)
//          self.bottomConstraint?.isActive = true
      }
    }

// MARK: - Extensions
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
        if range.location == 0 && range.length != 0 {
            self.completeButton.isEnabled = false
            completeButton.backgroundColor = .gray200
            completeButton.setTitleColor(.gray400, for: .disabled)
        } else {
            self.completeButton.isEnabled = true
            completeButton.backgroundColor = .orange600
            completeButton.setTitleColor(.gray50, for: .normal)
        }
        let cuerrentText = textField.text ?? ""
        guard let stringRange = Range(range, in: cuerrentText) else { return false }
        let changedText = cuerrentText.replacingCharacters(in: stringRange, with: string)
        countTextLabel.text = "(\(changedText.count)/20)"
        return changedText.count <= 19
    }
    
    func searchPressed(_ sender: UIButton) {
        moreVegetabletextField.endEditing(true)
          
    }
      
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        moreVegetabletextField.endEditing(true)
        print(moreVegetabletextField.text!)
        return true
    }
}
