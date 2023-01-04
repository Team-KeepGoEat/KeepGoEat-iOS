//
//  NewGoalViewController.swift
//  KeepGoEat-iOS
//
//  Created by 양정연 on 2022/12/27.
//

import UIKit

import Then
import SnapKit

final class NewGoalViewController: UIViewController {
    
    // MARK: Component
    private let textMyGoalLabel = UILabel().then {
        $0.text = "나의 목표를 입력해볼까요?"
        $0.textColor = .gray700
        $0.font = .system2Bold
    }
    
    private let moreVegetabletextField = UITextField().then {
        $0.placeholder = "ex) 하루 1끼 이상 야채"
        $0.font = .system4Bold
        $0.textColor = .gray400
    }
    
    private let underLineLabel = UIView().then {
        $0.backgroundColor = .gray500
    }
    
    private let countTextLabel = UILabel().then {
        $0.text = "(0/20)"
        $0.textColor = .gray400
        $0.font = .system5
    }
    
    private let moreEatLabel = UILabel().then {
        $0.text = "더먹기"
        $0.textColor = .gray700
        $0.font = .system4Bold
    }
    
    private lazy var completeButton = UIButton().then {
        $0.setTitle("완료", for: .normal)
        $0.titleLabel?.font = .system4Bold
        $0.setTitleColor(.gray400, for: .normal)
        $0.backgroundColor = .gray200
        $0.layer.cornerRadius = 8
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        layout()
    }
}

// MARK: - Extensions
extension NewGoalViewController {
    
    // MARK: - Layout Helpers
    private func layout() {
        view.backgroundColor = .white
        [textMyGoalLabel, moreVegetabletextField, countTextLabel, moreEatLabel, underLineLabel, completeButton].forEach {
            view.addSubview($0)
        }
        
        textMyGoalLabel.snp.makeConstraints {
            $0.top.equalToSuperview().offset(92)
            $0.leading.equalToSuperview().offset(20)
        }
        
        moreVegetabletextField.snp.makeConstraints {
            $0.top.equalTo(self.textMyGoalLabel.snp.bottom).offset(32)
            $0.leading.equalTo(textMyGoalLabel)
        }
        
        underLineLabel.snp.makeConstraints {
            $0.top.equalTo(self.moreVegetabletextField.snp.bottom).offset(10)
            $0.leading.equalTo(moreVegetabletextField)
            $0.height.equalTo(1)
            $0.width.equalTo(273)
        }
        
        countTextLabel.snp.makeConstraints {
            $0.top.equalTo(self.underLineLabel.snp.bottom).offset(8)
            $0.leading.equalTo(textMyGoalLabel)
        }
        
        moreEatLabel.snp.makeConstraints {
            $0.top.equalToSuperview().offset(146)
            $0.leading.equalTo(self.underLineLabel.snp.trailing).offset(16)
        }
        
        completeButton.snp.makeConstraints {
            $0.top.equalTo(self.countTextLabel.snp.bottom).offset(374)
            $0.centerX.equalToSuperview()
            $0.width.equalTo(343)
            $0.height.equalTo(48)
        }
    }
}
