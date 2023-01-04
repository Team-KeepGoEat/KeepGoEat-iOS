//
//  HomeCheerView.swift
//  KeepGoEat-iOS
//
//  Created by 양정연 on 2023/01/01.
//

import UIKit

class HomeCheerView: UIView {
    // MARK: - Variables
    // MARK: Component
    private let myPageButton = UIButton().then {
        $0.setImage(Const.Image.icnMypage, for: .normal)
    }
    private let characterImage = UIImageView().then {
        $0.image = Const.Image.snailOrangeDefault
    }
    private let cheerMessage = UILabel().then {
        $0.text = "안녕하세요. 당신을 응원합니다. 정말로요. 진짜로!!"
        $0.numberOfLines = 3
    }
    
    // MARK: - Function
    // MARK: LifeCycle
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setUI()
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: Layout Helpers
    private func setUI() {
        self.backgroundColor = .gray700
    }
    
    private func setLayout() {
        self.addSubviews(
            myPageButton,
            characterImage,
            cheerMessage
        )
        
        self.snp.makeConstraints {
            $0.height.equalTo(240.adjusted)
        }
        myPageButton.snp.makeConstraints {
            $0.top.equalToSuperview().inset(8.adjusted)
            $0.trailing.equalToSuperview().inset(16.adjusted)
            $0.width.height.equalTo(32.adjusted)
        }
        characterImage.snp.makeConstraints {
            $0.top.equalToSuperview().inset(72.adjusted)
            $0.leading.equalToSuperview().inset(16.adjusted)
            $0.width.height.equalTo(150.adjusted)
        }
    }
}
