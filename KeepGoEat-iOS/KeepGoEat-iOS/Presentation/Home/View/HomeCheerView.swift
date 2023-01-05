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
    private let cheerMessageView = UIView().then {
        $0.backgroundColor = .gray50
        $0.clipsToBounds = true
        $0.layer.cornerRadius = 16
        $0.layer.maskedCorners = CACornerMask(arrayLiteral: .layerMinXMinYCorner, .layerMaxXMinYCorner, .layerMaxXMaxYCorner)
    }
    private let cheerMessageLabel = UILabel().then {
        $0.text = "안녕하세요. 당신을 응원합니다. 정말로요. 진짜로!!"
        $0.numberOfLines = 3
    }
    
    // MARK: - Function
    // MARK: LifeCycle
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: Layout Helpers
    private func setLayout() {
        cheerMessageView.addSubview(cheerMessageLabel)
        self.addSubviews(
            myPageButton,
            characterImage,
            cheerMessageView
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
        cheerMessageView.snp.makeConstraints {
            $0.top.equalToSuperview().inset(72.adjusted)
            $0.leading.equalTo(characterImage.snp.trailing).offset(8.adjusted)
            $0.trailing.equalToSuperview().inset(17.adjusted)
        }
        cheerMessageLabel.snp.makeConstraints {
            $0.edges.equalToSuperview().inset(12)
        }
    }
}
