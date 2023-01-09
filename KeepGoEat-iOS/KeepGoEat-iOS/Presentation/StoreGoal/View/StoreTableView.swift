//
//  StoreTableView.swift
//  KeepGoEat-iOS
//
//  Created by 양정연 on 2023/01/09.
//

import UIKit

class StoreTableView: UITableView {
    
    // MARK: - Variables
    
    override init(frame: CGRect, style: UITableView.Style) {
        super.init(frame: frame, style: style)
        
        setRegister()
        setLayout()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setRegister() {
        self.delegate = self
        self.register(UITableViewCell.self, forCellReuseIdentifier: StoreTableViewCell.identifier)
    }
    private func setLayout() {
        self.contentInset.left = 16
        self.contentInset.right = 16
    }
}

}
