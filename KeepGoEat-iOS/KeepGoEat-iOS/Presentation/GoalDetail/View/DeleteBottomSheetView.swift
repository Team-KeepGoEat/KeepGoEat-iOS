//
//  DeleteBottomSheetView.swift
//  KeepGoEat-iOS
//
//  Created by 이승헌 on 2023/01/07.
//

import UIKit

class DeleteBottomSheetView: UIView {
    
    private let deleteTitle: UILabel = UILabel().then {
        $0.text = Const.String.deleteTitle
        $0.font = .system3Bold
        $0.textColor = .gray600
    }
    
    private let descriptionLabel: UILabel = UILabel().then {
        $0.text = Const.String.deleteDescription
        $0.font = .system4
        $0.textColor = .gray600
    }
    
    private let deleteImage: UIImageView = UIImageView().then {
        $0.image = Const.Image.trashImage
    }
    
    let cancelButton: UIButton = UIButton().then {
        $0.setTitle(Const.String.cancelButton, for: .normal)
        $0.setTitleColor(.white, for: .normal)
        $0.titleLabel?.font = .system4Bold
        $0.backgroundColor = .orange600
        $0.layer.cornerRadius = 8
    }
    
    let deleteButton: UIButton = UIButton().then {
        $0.setTitle(Const.String.deleteButton, for: .normal)
        $0.setTitleColor(.gray400, for: .normal)
        $0.titleLabel?.font = .system5Bold
        $0.backgroundColor = .gray200
        $0.layer.cornerRadius = 8
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

extension DeleteBottomSheetView {
    private func setUI() {
        self.backgroundColor = .clear
    }
    
    private func setLayout() {
        self.addSubviews(
            deleteTitle,
            descriptionLabel,
            deleteImage,
            cancelButton,
            deleteButton
        )
        
        deleteTitle.snp.makeConstraints {
            $0.top.equalToSuperview().inset(28.adjusted)
            $0.centerX.equalToSuperview()
        }
        
        descriptionLabel.snp.makeConstraints {
            $0.top.equalTo(deleteTitle.snp.bottom)
            $0.centerX.equalToSuperview()
        }
        
        deleteImage.snp.makeConstraints {
            $0.top.equalTo(descriptionLabel.snp.bottom).inset(-20.adjusted)
            $0.centerX.equalToSuperview()
            $0.width.equalTo(80.adjusted)
            $0.height.equalTo(80.adjusted)
        }
        
        cancelButton.snp.makeConstraints {
            $0.top.equalTo(deleteImage.snp.bottom).inset(-22.adjusted)
            $0.leading.equalToSuperview().inset(16.adjusted)
            $0.width.equalTo(165.adjusted)
            $0.height.equalTo(48.adjusted)
        }
        
        deleteButton.snp.makeConstraints {
            $0.top.equalTo(deleteImage.snp.bottom).inset(-22.adjusted)
            $0.trailing.equalToSuperview().inset(16.adjusted)
            $0.width.equalTo(165.adjusted)
            $0.height.equalTo(48.adjusted)
        }
    }
}
