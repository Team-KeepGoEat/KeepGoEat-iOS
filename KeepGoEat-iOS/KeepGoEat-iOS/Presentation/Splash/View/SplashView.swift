//
//  SplashView.swift
//  KeepGoEat-iOS
//
//  Created by 이승헌 on 2023/01/02.
//

import UIKit

class SplashView: UIView {
    
    // MARK: Component
    
    private let splashImage: UIImageView = UIImageView().then {
        $0.image = Const.Image.splashImage
        $0.contentMode = .scaleAspectFit
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
            splashImage
        )
        
        splashImage.snp.makeConstraints {
            $0.edges.equalTo(self.safeAreaLayoutGuide)
        }
    }
}
