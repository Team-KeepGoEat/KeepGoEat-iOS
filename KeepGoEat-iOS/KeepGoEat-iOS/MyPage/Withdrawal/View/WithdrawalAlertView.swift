//
//  WithdrawalAlertView.swift
//  KeepGoEat-iOS
//
//  Created by 정채은 on 2023/03/06.
//

import UIKit

import SnapKit
import Then

protocol HandleWithdrawAlertButtonDelegate: AnyObject {
    func withdrawOkButtonDidTap()
}

class WithdrawalAlertView: UIView {
    
    private var isAlertPresented: Bool = false
    weak var handleWithdrawAlertButtonDelegate: HandleWithdrawAlertButtonDelegate?
    
    // MARK: Components
    
    private let alertView = UIView().then {
        $0.backgroundColor = .gray50
        $0.layer.cornerRadius = 12
        $0.clipsToBounds = true
    }
    
    private let bodyStackView = UIStackView().then {
        $0.axis = .vertical
        $0.spacing = 16.adjusted
    }
    
    private let logoutTitle = UILabel().then {
        $0.text = Const.String.withdrawalAlertTitle
        $0.textColor = .gray800
        $0.font = .system4Bold
        $0.textAlignment = .center
    }
    
    private let logoutDescription = UILabel().then {
        $0.text = Const.String.withdrawalAlertDescription
        $0.numberOfLines = 0
        $0.textColor = .gray500
        $0.font = .system5
        $0.textAlignment = .center
        let attrString = NSMutableAttributedString(string: $0.text!)
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineSpacing = 6
        attrString.addAttribute(NSAttributedString.Key.paragraphStyle, value: paragraphStyle, range: NSMakeRange(0, attrString.length))
        $0.attributedText = attrString
        $0.textAlignment = .center
    }
    
    private let separateLineView = UIView().then {
        $0.backgroundColor = .gray300
    }
    
    private let noButton = UIButton().then {
        $0.setTitle(Const.String.noButton, for: .normal)
        $0.setTitleColor(.gray800, for: .normal)
        $0.titleLabel?.font = .system4Bold
    }

    private let yesButton = UIButton().then {
        $0.setTitle(Const.String.withdrawalAlertButton, for: .normal)
        $0.setTitleColor(.orange600, for: .normal)
        $0.titleLabel?.font = .system4
    }
    
    private let transparentView = UIView().then {
        $0.backgroundColor = UIColor.black.withAlphaComponent(0.5)
        $0.isUserInteractionEnabled = true
    }
    
    // MARK: LifeCycle
    override init(frame: CGRect) {
        super.init(frame: CGRect.zero)
        setUI()
        setAddTarget()
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func showAlert() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(dismissAlert))
        transparentView.addGestureRecognizer(tapGesture)
        self.addSubview(transparentView)
        transparentView.addSubview(alertView)
        self.isHidden = false
        setUI()
        setAddTarget()
        setLayout()
        isAlertPresented = true
    }
    
    @objc func dismissAlert() {
        self.alertView.removeFromSuperview()
        self.transparentView.removeGestureRecognizer(self.transparentView.gestureRecognizers!.first!)
        self.transparentView.removeFromSuperview()
        self.isHidden = true
//        print(self.superview?.subviews ?? [])
        isAlertPresented = false
    }
}
    
extension WithdrawalAlertView {
    
    private func setUI() {
        self.backgroundColor = .clear
    }
    
    private func setAddTarget() {
        noButton.addTarget(self, action: #selector(noButtonDidTap), for: .touchUpInside)
        yesButton.addTarget(self, action: #selector(yesButtonDidTap), for: .touchUpInside)
    }
    
    @objc private func noButtonDidTap() {
        dismissAlert()
    }
    
    @objc private func yesButtonDidTap() {
        dismissAlert()
        self.handleWithdrawAlertButtonDelegate?.withdrawOkButtonDidTap()
        
    }
    
    private func setLayout() {
        self.addSubview(self.transparentView)
        self.transparentView.addSubview(self.alertView)
        [self.bodyStackView, self.separateLineView, self.noButton, self.yesButton]
              .forEach(self.alertView.addSubview(_:))
        [self.logoutTitle, self.logoutDescription]
            .forEach(self.bodyStackView.addArrangedSubview(_:))
        
        transparentView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        alertView.snp.makeConstraints {
            $0.width.equalTo(225.adjusted)
            $0.height.equalTo(162.adjusted)
            $0.centerX.equalToSuperview()
            $0.centerY.equalToSuperview()
        }
        
        bodyStackView.snp.makeConstraints {
            $0.top.equalToSuperview().offset(20.adjusted)
            $0.leading.trailing.equalToSuperview().inset(16.adjusted)
        }
        
        separateLineView.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.bottom.equalToSuperview().offset(-16.adjusted)
            $0.width.equalTo(1.adjusted)
            $0.height.equalTo(16.adjusted)
        }
        
        noButton.snp.makeConstraints {
            $0.centerY.equalTo(separateLineView.snp.centerY)
            $0.centerX.equalTo(alertView.snp.centerX).dividedBy(2)
        }
        
        yesButton.snp.makeConstraints {
            $0.centerY.equalTo(separateLineView.snp.centerY)
            $0.centerX.equalTo(alertView.snp.centerX).dividedBy(0.6666)
        }
    }
}
