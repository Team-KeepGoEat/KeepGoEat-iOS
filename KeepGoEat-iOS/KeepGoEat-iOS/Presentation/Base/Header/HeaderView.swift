//
//  HeaderView.swift
//  KeepGoEat-iOS
//
//  Created by 이승헌 on 2023/01/05.
//

import UIKit

class HeaderView: UIView {
    
    // MARK: Component
    private let backButton: UIButton = UIButton().then {
        $0.setImage(Const.Image.icnLeft, for: .normal)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setUI()
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension HeaderView {
    private func setUI() {
        self.backgroundColor = .white
        
        self.layer.shadowOffset = CGSize(width: 0, height: 2)
        self.layer.shadowOpacity = 0.05
    }
    
    private func setLayout() {
        self.addSubview(
            backButton
        )
        
        self.snp.makeConstraints {
            $0.width.equalTo(UIScreen.main.bounds.width)
            $0.height.equalTo(48.adjusted)
        }
        
        backButton.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.leading.equalToSuperview().inset(16.adjusted)
            $0.width.height.equalTo(32.adjusted)
        }
    }
}
