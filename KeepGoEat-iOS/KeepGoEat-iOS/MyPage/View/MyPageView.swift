//
//  MyPageView.swift
//  KeepGoEat-iOS
//
//  Created by 정채은 on 2023/03/08.
//

import UIKit

import Then
import SnapKit

//TODO: 유저네임 버튼 레이아웃


class MyPageView: UIView {
    
    // MARK: Component
    
    let headerView: HeaderView = HeaderView()
    
    private let headerViewTitle = UILabel().then {
        $0.text = Const.String.myPage
        $0.textColor = .gray800
        $0.font = .system4Bold
    }
    
    private let accountButton = UIButton().then {
        $0.setTitle("user214", for: .normal)
        $0.setTitleColor(.gray800, for: .normal)
        $0.titleLabel?.font = .system3Bold
        $0.setImage(Const.Image.icnSubpage, for: .normal)
//        $0.contentEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        $0.semanticContentAttribute = .forceRightToLeft
    }
    
    private let emailLabel = UILabel().then {
        $0.text = "keepgoeat@kakao.com"
        $0.textColor = .gray600
        $0.font = .system5
    }
    
    private let storeGoalButton = UIButton()
    
    private let storeGoalLabel = UILabel().then {
        $0.text = Const.String.storeGoal
        $0.textColor = .gray800
        $0.font = .system4
    }
    
    private let storeGoalCount = UILabel().then {
        $0.text = "3"
        $0.textColor = .orange600
        $0.font = .system4Bold
    }
    
    private let storeGoalSubPageButton = UIButton().then {
        $0.setImage(Const.Image.icnSubpage, for: .normal)
    }
    
    private let lineView1 = UIView().then {
        $0.backgroundColor = .gray200
    }
    
    private let contactAndReviewLabel = UILabel().then {
        $0.text = Const.String.contactAndReview
        $0.textColor = .gray500
        $0.font = .system5Bold
    }
    
    private let contactButton = UIButton().then {
        $0.setTitle(Const.String.contact, for: .normal)
        $0.setTitleColor(.gray800, for: .normal)
        $0.titleLabel?.font = .system4
    }
    
    private let reviewButton = UIButton().then {
        $0.setTitle(Const.String.review, for: .normal)
        $0.setTitleColor(.gray800, for: .normal)
        $0.titleLabel?.font = .system4
    }
    
    private let lineView2 = UIView().then {
        $0.backgroundColor = .gray200
    }
    
    private let appInfoLabel = UILabel().then {
        $0.text = Const.String.appInfo
        $0.textColor = .gray500
        $0.font = .system5Bold
    }
    
    private let servicePresentButton = UIButton().then {
        $0.setTitle(Const.String.servicePresent, for: .normal)
        $0.setTitleColor(.gray800, for: .normal)
        $0.titleLabel?.font = .system4
    }
    
    private let versionInfoLabel = UILabel().then {
        $0.text = Const.String.versionInfo
        $0.textColor = .gray800
        $0.font = .system4
    }
    
    private let versionLabel = UILabel().then {
        $0.text = Const.String.version
        $0.textColor = .gray400
        $0.font = .system4
    }
    
    private let lineView3 = UIView().then {
        $0.backgroundColor = .gray200
    }
        
    private let termsAndPrivacyLabel = UILabel().then {
        $0.text = Const.String.termsAndPrivacy
        $0.textColor = .gray500
        $0.font = .system5Bold
    }
    
    private let serviceTermsButton = UIButton().then {
        $0.setTitle(Const.String.serviceTerms, for: .normal)
        $0.setTitleColor(.gray800, for: .normal)
        $0.titleLabel?.font = .system4
    }
    
    private let privacyButton = UIButton().then {
        $0.setTitle(Const .String.privacy, for: .normal)
        $0.setTitleColor(.gray800, for: .normal)
        $0.titleLabel?.font = .system4
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
    
}
extension MyPageView {
    private func setUI() {
        self.backgroundColor = .white
    }
    private func setLayout() {
        self.addSubviews(
        headerView,
        accountButton,
        emailLabel,
        storeGoalButton,
        storeGoalSubPageButton,
        lineView1,
        contactAndReviewLabel,
        contactButton,
        reviewButton,
        lineView2,
        appInfoLabel,
        servicePresentButton,
        versionInfoLabel,
        versionLabel,
        lineView3,
        termsAndPrivacyLabel,
        serviceTermsButton,
        privacyButton
        )
        
        headerView.addSubview(
            headerViewTitle
        )
        
        storeGoalButton.addSubviews(
            storeGoalLabel,
            storeGoalCount
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
        
        accountButton.snp.makeConstraints{
            $0.top.equalTo(headerView.snp.bottom).offset(20.adjusted)
            $0.leading.equalToSuperview().inset(16.adjusted)
        }
//        accountButton.imageView?.snp.makeConstraints {
//            $0.right.equalToSuperview()
//        }
//        accountButton.titleLabel?.snp.makeConstraints {
//            $0.left.equalToSuperview()
//        }
        emailLabel.snp.makeConstraints{
            $0.top.equalTo(accountButton.snp.bottom)
            $0.leading.equalTo(accountButton)
        }
        storeGoalButton.snp.makeConstraints{
            $0.leading.equalToSuperview().inset(14.adjusted)
            $0.top.equalTo(emailLabel.snp.bottom).offset(24.adjusted)
            $0.width.equalTo(102.adjusted)
        }
        storeGoalLabel.snp.makeConstraints{
            $0.leading.equalToSuperview().inset(2.adjusted)
            $0.centerY.equalToSuperview()
        }
        storeGoalCount.snp.makeConstraints{
            //TODO: 레이아웃 다시 설정 필요
            $0.trailing.equalToSuperview().offset(-7.adjusted)
            $0.centerY.equalToSuperview()
        }
        storeGoalSubPageButton.snp.makeConstraints{
            $0.trailing.equalToSuperview().inset(14.adjusted)
            $0.centerY.equalTo(storeGoalButton)
        }
        lineView1.snp.makeConstraints{
            $0.width.equalToSuperview()
            $0.height.equalTo(2.adjusted)
            $0.top.equalTo(storeGoalButton.snp.bottom).offset(12.adjusted)
        }
        contactAndReviewLabel.snp.makeConstraints{
            $0.top.equalTo(lineView1.snp.bottom).offset(16.adjusted)
            $0.leading.equalToSuperview().inset(16.adjusted)
        }
        contactButton.snp.makeConstraints{
            $0.top.equalTo(contactAndReviewLabel.snp.bottom).offset(16.adjusted)
            $0.leading.equalTo(contactAndReviewLabel)
        }
        reviewButton.snp.makeConstraints{
            $0.top.equalTo(contactButton.snp.bottom).offset(24.adjusted)
            $0.leading.equalTo(contactAndReviewLabel)
        }
        lineView2.snp.makeConstraints{
            $0.width.equalToSuperview()
            $0.height.equalTo(2.adjusted)
            $0.top.equalTo(reviewButton.snp.bottom).offset(16.adjusted)
        }
        appInfoLabel.snp.makeConstraints{
            $0.top.equalTo(lineView2.snp.bottom).offset(16.adjusted)
            $0.leading.equalToSuperview().inset(16.adjusted)
        }
        servicePresentButton.snp.makeConstraints{
            $0.top.equalTo(appInfoLabel.snp.bottom).offset(16.adjusted)
            $0.leading.equalTo(appInfoLabel)
        }
        versionInfoLabel.snp.makeConstraints{
            $0.top.equalTo(servicePresentButton.snp.bottom).offset(24.adjusted)
            $0.leading.equalTo(appInfoLabel)
        }
        versionLabel.snp.makeConstraints{
            $0.centerY.equalTo(versionInfoLabel)
            $0.trailing.equalToSuperview().inset(15.adjusted)
        }
        lineView3.snp.makeConstraints{
            $0.width.equalToSuperview()
            $0.height.equalTo(2.adjusted)
            $0.top.equalTo(versionInfoLabel.snp.bottom).offset(16.adjusted)
        }
        termsAndPrivacyLabel.snp.makeConstraints{
            $0.top.equalTo(lineView3.snp.bottom).offset(16.adjusted)
            $0.leading.equalToSuperview().inset(16.adjusted)
        }
        serviceTermsButton.snp.makeConstraints{
            $0.top.equalTo(termsAndPrivacyLabel.snp.bottom).offset(16.adjusted)
            $0.leading.equalTo(termsAndPrivacyLabel)
        }
        privacyButton.snp.makeConstraints{
            $0.top.equalTo(serviceTermsButton.snp.bottom).offset(20.adjusted)
            $0.leading.equalTo(termsAndPrivacyLabel)
        }
        
    }
    
    private func setAddTarget() {
        accountButton.addTarget(self, action: #selector(tapAccountButton), for: .touchUpInside)
        storeGoalButton.addTarget(self, action: #selector(tapStoreGoalButton), for: .touchUpInside)
        storeGoalSubPageButton.addTarget(self, action: #selector(tapStoreGoalSubPageButton), for: .touchUpInside)
        contactButton.addTarget(self, action: #selector(tapContactButton), for: .touchUpInside)
        reviewButton.addTarget(self, action: #selector(tapReviewButton), for: .touchUpInside)
        servicePresentButton.addTarget(self, action: #selector(tapServicePresentButton), for: .touchUpInside)
        serviceTermsButton.addTarget(self, action: #selector(tapServiceTermsButton), for: .touchUpInside)
        privacyButton.addTarget(self, action: #selector(tapPrivacyButton), for: .touchUpInside)
        
    }
    
    @objc func tapAccountButton(){
        
    }
    @objc func tapStoreGoalButton(){
        
    }
    @objc func tapStoreGoalSubPageButton(){
        
    }
    @objc func tapContactButton(){
        
    }
    @objc func tapReviewButton(){
        
    }
    @objc func tapServicePresentButton(){
        
    }
    @objc func tapServiceTermsButton(){
        
    }
    @objc func tapPrivacyButton(){
        
    }
    
}

