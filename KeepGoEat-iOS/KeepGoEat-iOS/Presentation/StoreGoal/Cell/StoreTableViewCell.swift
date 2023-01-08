//
//  StoreTableViewCell.swift
//  KeepGoEat-iOS
//
//  Created by 양정연 on 2023/01/08.
//

import UIKit

class StoreTableViewCell: UITableViewCell {
    
    // MARK: - Variables
    // MARK: Identifier
    static let identifier = "StoreTableViewCell"
    
    // MARK: Component
    private let kindTagImage = UIImageView().then {
        $0.image = Const.Image.moreTag
    }
    private let goalContentLabel = UILabel().then {
        $0.font = .system2Bold
        $0.text = "오늘의 목표 내용"
        $0.textColor = .gray800
    }
    
    // MARK: - Function
    // MARK: LifeCycle
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
