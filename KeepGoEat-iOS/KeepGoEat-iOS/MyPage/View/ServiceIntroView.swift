//
//  MyPageServiceIntro.swift
//  KeepGoEat-iOS
//
//  Created by 정채은 on 2023/03/14.
//

import UIKit

import Then
import SnapKit


class ServiceIntroView: UIView {
    
    let headerView: HeaderView = HeaderView()
    
    private let headerViewTitle = UILabel().then {
        $0.text = Const.String.servicePresent
        $0.textColor = .gray800
        $0.font = .system4Bold
    }
    
    private lazy var scrollView = UIScrollView().then {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.isScrollEnabled = true
    }
    
    private let backgroundImage : UIImageView = UIImageView().then {
        $0.image = Const.Image.serviceIntro
//        $0.contentMode = .scaleAspectFit
//        $0.translatesAutoresizingMaskIntoConstraints = false
    }
    
    private let introLabelView = UIView().then {
        $0.backgroundColor = .white
        $0.layer.cornerRadius = 12.adjusted
//        $0.translatesAutoresizingMaskIntoConstraints = false
    }
    
    private let introLabel = UILabel().then {
        $0.numberOfLines = 16
        $0.text = Const.String.serviceIntro
        $0.textColor = .black
        $0.font = .system5
        $0.textAlignment = .left
        let attrString = NSMutableAttributedString(string: $0.text!)
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineSpacing = 4
        attrString.addAttribute(NSAttributedString.Key.paragraphStyle, value: paragraphStyle, range: NSMakeRange(0, attrString.length))
        $0.attributedText = attrString
//        $0.translatesAutoresizingMaskIntoConstraints = false
    }
    
    private let openSourceButton = UIButton()
    
    private let openSourceLabel = UILabel().then {
        $0.text = Const.String.openSource
        $0.textColor = .gray800
        $0.font = .system4
//        $0.translatesAutoresizingMaskIntoConstraints = false
    }
    
    private let openSourceSubPageImageView = UIImageView().then {
        $0.image = Const.Image.icnRight
//        $0.translatesAutoresizingMaskIntoConstraints = false
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

extension ServiceIntroView {
    private func setUI() {
        self.backgroundColor = .white
    }
    
    private func setLayout(){
        self.addSubviews(headerView, scrollView)
        
        headerView.addSubview(headerViewTitle)
            
        scrollView.addSubviews(
        backgroundImage,
        introLabelView,
        introLabel,
        openSourceButton
        )
        
        openSourceButton.addSubviews(
        openSourceLabel,
        openSourceSubPageImageView
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
        scrollView.snp.makeConstraints{
//            $0.top.equalTo(headerView.snp.bottom)
//            $0.width.equalTo(self.safeAreaLayoutGuide)
//            $0.edges.equalTo(self.safeAreaLayoutGuide)
//            $0.bottom.equalTo(self.safeAreaLayoutGuide)
            $0.top.equalTo(headerView.snp.bottom)
            $0.leading.trailing.bottom.equalToSuperview()
            $0.width.equalToSuperview()
//            $0.bottom.equalTo(self.safeAreaLayoutGuide)
        }
        backgroundImage.snp.makeConstraints{
            $0.top.equalTo(headerView.snp.bottom)
            $0.width.equalToSuperview()
        }
        introLabelView.snp.makeConstraints{
            $0.centerX.equalToSuperview()
            $0.top.equalTo(backgroundImage.snp.top).offset(80.adjusted)
            $0.leading.trailing.equalTo(16.adjusted)
            $0.height.equalTo(376)
        }
        introLabel.snp.makeConstraints{
//            $0.top.bottom.equalTo(introLabelView.snp.top).offset(20.adjusted)
            $0.centerY.equalTo(introLabelView)
            $0.leading.equalTo(introLabelView).offset(20.adjusted)
        }
        
        openSourceButton.snp.makeConstraints{
            $0.top.equalTo(backgroundImage.snp.bottom).offset(16.adjusted)
            $0.height.equalTo(32.adjusted)
            $0.leading.trailing.equalToSuperview().offset(16.adjusted)
        }
        
        openSourceLabel.snp.makeConstraints{
            $0.leading.equalToSuperview()
            $0.centerY.equalToSuperview()
        }
        
        openSourceSubPageImageView.snp.makeConstraints{
            $0.trailing.equalToSuperview()
            $0.centerY.equalToSuperview()
        }
//        scrollView.layoutIfNeeded()
    }
    
    private func setAddTarget() {
        openSourceButton.addTarget(self, action: #selector(openSourceButtonDidTap), for: .touchUpInside)
    }
    
    @objc func openSourceButtonDidTap(){
            let url = URL(string: "https://68space.notion.site/iOS-c9b05b70c82648f9812ed8345cce2f4f")!
            UIApplication.shared.open(url, options: [:], completionHandler: nil)
    }
}
