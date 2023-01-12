//
//  HomeCheerView.swift
//  KeepGoEat-iOS
//
//  Created by 양정연 on 2023/01/01.
//

import UIKit

import Lottie
import SnapKit
import Then

enum TimezoneType: Int {
    case day
    case night
    case sun
}
enum CharacterType: String {
    case hungry
    case cheer
}

class HomeCheerView: UIView {
    
    // MARK: - Variables
    // MARK: Component
    private let backgroundImage = UIImageView().then {
        $0.image = Const.Image.homeBackgroundImageDay
    }
    private let myPageButton = UIButton().then {
        $0.setImage(Const.Image.icnMypage, for: .normal)
        $0.contentMode = .scaleAspectFill
        $0.clipsToBounds = true
    }
    private let characterImage = UIImageView().then {
        $0.image = Const.Image.snailGreenRibon
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
        $0.font = .system4Bold
    }
    private lazy var backgroundAnimationView = LottieAnimationView().then {
        $0.animation = LottieAnimation.named("homeBackground")
        $0.contentMode = .scaleAspectFit
        $0.loopMode = .playOnce
    }
    private lazy var characterAnimationView = LottieAnimationView().then {
        $0.animation = LottieAnimation.named("homeSnail")
        $0.contentMode = .scaleAspectFit
        $0.loopMode = .playOnce
    }
    
    // MARK: - Function
    // MARK: LifeCycle
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setLayout()
        setAddTarget()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: Layout Helpers
    private func setLayout() {
        cheerMessageView.addSubview(cheerMessageLabel)
        self.addSubviews(
            backgroundImage,
            myPageButton,
            characterImage,
            cheerMessageView
        )
        self.sendSubviewToBack(backgroundImage)
        backgroundImage.addSubview(backgroundAnimationView)
        characterImage.addSubview(characterAnimationView)
        
        self.snp.makeConstraints {
            $0.height.equalTo(245.adjusted)
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
            $0.leading.equalTo(characterImage.snp.trailing).inset(-8.adjusted)
            $0.trailing.equalToSuperview().inset(17.adjusted)
        }
        cheerMessageLabel.snp.makeConstraints {
            $0.edges.equalToSuperview().inset(12)
        }
        backgroundAnimationView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        characterAnimationView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
    
    // MARK: Custom Function
    private func setDelegate() {
        
    }
    private func setAddTarget() {
        myPageButton.addTarget(self, action: #selector(myPageButtonDidTap), for: .touchUpInside)
    }
    func setCharacterImage(characterType: CharacterType) {
        switch characterType {
        case .hungry:
            characterImage.image = Const.Image.snailOrangeHungry
        case .cheer:
            characterImage.image = Const.Image.snailOrangeCheer
        }
    }
    func setBackgroundImage(timezoneType: TimezoneType) {
        switch timezoneType {
        case .day:
            backgroundImage.image = Const.Image.homeBackgroundImageDay
        case .sun:
            backgroundImage.image = Const.Image.homeBackgroundImageSun
        case .night:
            backgroundImage.image = Const.Image.homeBackgroundImageNight
        }
    }
    func updatecheerMessageLabelText(string: String) {
        cheerMessageLabel.text = string
    }
    func playHomeLottie() {
        backgroundAnimationView.stop()
        characterAnimationView.stop()
        backgroundAnimationView.play()
        characterAnimationView.play()
    }
    
    @objc
    private func myPageButtonDidTap() {
        // TODO: 마이페이지로 연결
    }
}
