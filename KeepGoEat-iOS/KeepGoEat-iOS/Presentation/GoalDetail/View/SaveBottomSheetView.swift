//
//  SaveBottomSheetView.swift
//  KeepGoEat-iOS
//
//  Created by 이승헌 on 2023/01/07.
//

import UIKit

class SaveBottomSheetView: UIView {
    
    private let bottomSheetTitleLabel: UILabel = UILabel().then {
        $0.font = .system5
        $0.textColor = .gray600
        $0.setTextWithLineHeight(text: Const.String.goalDetailBottomSheetTitle, lineHeight: 21)
    }
    
    private let bottomSheetImageView: UIImageView = UIImageView().then {
        $0.image = Const.Image.snailOrangeCheerLeft
    }
    
    private let bottomSheetSaveButton: UIButton = UIButton().then {
        $0.setTitle(Const.String.goalDetailBottomSheetSaveButton, for: .normal)
        $0.backgroundColor = .orange600
        $0.titleLabel?.font = .system4Bold
        $0.titleLabel?.textAlignment = .center
        $0.layer.cornerRadius = 8
    }
    
    let bottomSheetDeleteButton: UIButton = UIButton().then {
        $0.setTitle(Const.String.goalDetailBottomSheetDeleteButton, for: .normal)
        $0.titleLabel?.font = .system6
        $0.titleLabel?.textAlignment = .center
        $0.setTitleColor(.gray500, for: .normal)
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

extension SaveBottomSheetView {
    private func setUI() {
        self.backgroundColor = .clear
    }
    
    private func setLayout() {
        self.addSubviews(
            bottomSheetTitleLabel,
            bottomSheetImageView,
            bottomSheetSaveButton,
            bottomSheetDeleteButton
        )
       
        bottomSheetTitleLabel.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalToSuperview().inset(28.adjusted)
            $0.height.equalTo(42.adjusted)
        }
        
        bottomSheetImageView.snp.makeConstraints {
            $0.top.equalTo(bottomSheetTitleLabel.snp.bottom).inset(-4.adjusted)
            $0.centerX.equalToSuperview()
            $0.width.height.equalTo(120.adjusted)
        }
        
        bottomSheetSaveButton.snp.makeConstraints {
            $0.top.equalTo(bottomSheetImageView.snp.bottom).inset(-4.adjusted)
            $0.directionalHorizontalEdges.equalToSuperview().inset(16.adjusted)
            $0.height.equalTo(48.adjusted)
        }
        
        bottomSheetDeleteButton.snp.makeConstraints {
            $0.top.equalTo(bottomSheetSaveButton.snp.bottom).inset(-12.adjusted)
            $0.centerX.equalToSuperview()
        }
    }
}
