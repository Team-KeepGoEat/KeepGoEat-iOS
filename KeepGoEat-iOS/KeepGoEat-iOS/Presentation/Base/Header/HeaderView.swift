//
//  HeaderView.swift
//  KeepGoEat-iOS
//
//  Created by 이승헌 on 2023/01/05.
//

import UIKit

protocol HandleBackButtonDelegate: AnyObject {
    func popView()
}

class HeaderView: UIView {
    
    // MARK: Variables
    weak var handleBackButtonDelegate: HandleBackButtonDelegate?
    
    // MARK: Component
    private let backButton: UIButton = UIButton().then {
        $0.setImage(Const.Image.icnLeft, for: .normal)
    }
    
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

extension HeaderView {
    private func setUI() {
        self.backgroundColor = .white
        
        self.layer.shadowOffset = CGSize(width: 0, height: 4)
        self.layer.shadowOpacity = 0.05
    }
    
    private func setLayout() {
        self.addSubview(
            backButton
        )
        
        self.snp.makeConstraints {
            $0.width.equalTo(UIScreen.main.bounds.size.width)
            $0.height.equalTo(48)
        }
        
        backButton.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.leading.equalToSuperview().inset(16.adjusted)
            $0.width.height.equalTo(32.adjusted)
        }
    }
    
    private func setAddTarget() {
        backButton.addTarget(self, action: #selector(backButtonDidTap), for: .touchUpInside)
    }
    
    @objc
    private func backButtonDidTap() {
        self.handleBackButtonDelegate?.popView()
    }
}
