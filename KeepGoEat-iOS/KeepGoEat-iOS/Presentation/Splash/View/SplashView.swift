//
//  SplashView.swift
//  KeepGoEat-iOS
//
//  Created by 이승헌 on 2023/01/02.
//

import UIKit

class SplashView: UIView {
    
    // MARK: Component
    
    private let logoImage: UIImageView = UIImageView().then {
        $0.image = Const.Image.splashLogo
    }
    
    private let mainImage: UIImageView = UIImageView().then {
        $0.image = Const.Image.splashImage
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

extension SplashView {
    private func setUI() {
        self.backgroundColor = .white
    }
    
    private func setLayout() {
        self.addSubviews(
            logoImage,
            mainImage
        )
        
        logoImage.snp.makeConstraints {
            $0.width.equalTo(200.adjusted)
            $0.height.equalTo(120.adjusted)
            $0.top.equalTo(self.safeAreaLayoutGuide).inset(24.adjusted)
            $0.leading.equalTo(self.safeAreaLayoutGuide).inset(25.adjusted)
        }
        
        mainImage.snp.makeConstraints {
            $0.width.equalTo(360.adjusted)
            $0.height.equalTo(454.adjusted)
            $0.bottom.equalToSuperview().inset(41.adjusted)
            $0.centerX.equalToSuperview()
        }
    }
}
