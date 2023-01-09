//
//  StoreTableView.swift
//  KeepGoEat-iOS
//
//  Created by 양정연 on 2023/01/09.
//

import UIKit

class StoreTableView: UITableView {
    
    // MARK: - Variables
    let data = getStoreGoalDataList[1]
    
    override init(frame: CGRect, style: UITableView.Style) {
        super.init(frame: frame, style: style)
        
        setRegister()
        setUI()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setRegister() {
        self.register(UITableViewCell.self, forCellReuseIdentifier: StoreTableViewCell.identifier)
    }
    private func setUI() {
        
    }
}

}
