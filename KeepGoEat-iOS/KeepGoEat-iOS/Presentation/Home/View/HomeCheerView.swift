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
    private let backgroundImage = UIImageView().then {
        $0.image = Const.Image.homeBackground
    }
    private let myPageButton = UIButton().then {
        $0.setImage(Const.Image.icnMypage, for: .normal)
        $0.contentMode = .scaleAspectFill
        $0.clipsToBounds = true
//        $0.center = view.center
//                self.view.sendSubviewToBack(imageView)
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
        $0.text = "완벽하지 않아도 괜찮아요, 오늘도 킵고잇!"
        $0.numberOfLines = 3
    }
    
    // MARK: - Function
    // MARK: LifeCycle
    override init(frame: CGRect) {
        super.init(frame: frame)
        
//        setUI()
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: Layout Helpers
    private func setUI() {
        self.backgroundColor = .homeBackgroundBlue
    }
    private func setLayout() {
        cheerMessageView.addSubview(cheerMessageLabel)
        self.addSubviews(
            backgroundImage,
            myPageButton,
            characterImage,
            cheerMessageView
        )
        self.sendSubviewToBack(backgroundImage)
        
        self.snp.makeConstraints {
            $0.height.equalTo(240.adjusted)
        }
        backgroundImage.snp.makeConstraints {
            $0.edges.equalToSuperview()
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
