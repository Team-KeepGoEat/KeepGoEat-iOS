//
//  StoreGoalView.swift
//  KeepGoEat-iOS
//
//  Created by 양정연 on 2023/01/08.
//

import UIKit

import SnapKit
import Then

class StoreGoalView: UIView {

    // MARK: Component
    private let headerView = HeaderView()
    private let headerLabel = UILabel().then {
        $0.font = .system4Bold
        $0.textColor = .gray800
        $0.text = Const.String.storeTitle
    }
    private let totalButton = UIButton().then {
        $0.titleLabel?.font = .system5
        $0.setTitle("전체", for: .normal)
        $0.setTitleColor(.gray800, for: .normal)
        $0.contentEdgeInsets = UIEdgeInsets(top: 2, left: 5, bottom: 2, right: 5
    }
    private let moreButton = UIButton().then {
        $0.titleLabel?.font = .system5
        $0.setTitle("더먹기", for: .normal)
        $0.setTitleColor(.gray400, for: .normal)
    }
    private let lessButton = UIButton().then {
        $0.titleLabel?.font = .system5
        $0.setTitle("덜먹기", for: .normal)
        $0.setTitleColor(.gray400, for: .normal)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUI()
        setLayout()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setUI() {
        self.backgroundColor = .gray50
    }
    */

}
