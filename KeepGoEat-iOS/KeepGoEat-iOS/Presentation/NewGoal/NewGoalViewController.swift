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
    private let newGoalLabel = UILabel().then {
        $0.text = "나의 목표를 입력해볼까요?"
        $0.textColor = .green700
        $0.font = .system2Bold
    }
    
    private let moreEatLabel = UILabel().then {
        $0.text = "더먹기"
        $0.textColor = .green700
        $0.font = .system4Bold
    }
    
    private lazy var completeButton = UIButton().then {
        $0.setTitle("완료", for: .normal)
        $0.titleLabel?.font = .system4Bold
        $0.setTitleColor(.gray200, for: .normal)
        $0.backgroundColor = .gray400
        $0.layer.cornerRadius = 9
    }
    
    private let moreVegetabletextField = UITextField().then {
        $0.placeholder = "ex) 하루 1끼 이상 야채"
        $0.font = .system4Bold
        $0.textColor = .gray400
    }
    
    private let underLineLabel = UIView().then {
        $0.backgroundColor = .gray500
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
}
