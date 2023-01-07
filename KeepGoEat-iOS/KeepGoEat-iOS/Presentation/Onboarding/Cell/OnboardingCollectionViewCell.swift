//
//  OnboardingCollectionViewCell.swift
//  KeepGoEat-iOS
//
//  Created by 최가연 on 2023/01/06.
//

import UIKit

import SnapKit
import Then

// MARK: - OnboardingCollectionViewCell
final class OnboardingCollectionViewCell: UICollectionViewCell {
    
    // MARK: - Identifier
       
    static let identifier = "OnboardingCollectionViewCell"
    
    // MARK: - UI Component
    private let titleLabel = UILabel().then {
        $0.textColor = .gray800
        $0.font = .system3Bold
    }
    
    private let descrtiptionLabel = UILabel().then {
        $0.numberOfLines = 2
        $0.textColor = .gray800
        $0.font = .system5
        $0.textAlignment = .center
    }
    
    private let animation = UIImageView()
    
    // MARK: - Life Cycles
    override init(frame: CGRect) {
        super.init(frame: frame)
        layout()
        setUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Extensions

extension OnboardingCollectionViewCell {
    
    // MARK: - Layout Helpers
    private func setUI() {
        contentView.backgroundColor = .white
    }
    
    private func layout() {
        
        [titleLabel, descrtiptionLabel, animation].forEach {
            contentView.addSubview($0)
        }
        
        titleLabel.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.centerX.equalToSuperview()
        }
        
        descrtiptionLabel.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(4.adjusted)
            $0.centerX.equalToSuperview()
        }
        
        animation.snp.makeConstraints {
            $0.top.equalTo(descrtiptionLabel.snp.bottom).offset(26.adjusted)
            $0.width.equalTo(375.adjusted)
            $0.height.equalTo(268.adjusted)
            $0.centerX.equalToSuperview()
        }
    }
    
    func dataBind(model: OnboardingDataModel) {
        titleLabel.text = model.title
        descrtiptionLabel.text = model.descrtiption
        animation.image = UIImage(named: model.animation)
    }
}
