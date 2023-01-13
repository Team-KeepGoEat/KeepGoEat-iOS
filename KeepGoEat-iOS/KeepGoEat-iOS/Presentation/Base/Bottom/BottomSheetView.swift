//
//  BottomSheetView.swift
//  KeepGoEat-iOS
//
//  Created by 이승헌 on 2023/01/04.
//

import UIKit

class BottomSheetView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension BottomSheetView {
    private func setUI() {
        self.backgroundColor = .white
        
        self.layer.cornerRadius = 10
        self.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
    }
}
