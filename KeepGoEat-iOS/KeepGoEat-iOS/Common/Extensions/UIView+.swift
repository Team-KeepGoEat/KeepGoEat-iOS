//
//  UIView+.swift
//  KeepGoEat-iOS
//
//  Created by 양정연 on 2022/12/30.
//

import UIKit.UIView

extension UIView {
    func addSubviews(_ views: UIView...) {
        views.forEach { self.addSubview($0) }
    }

    var borderWidth: CGFloat {
        get {
            return layer.borderWidth
        }
        set {
            layer.borderWidth = newValue
            layer.masksToBounds = newValue > 0
        }
    }
    
    var borderColor: UIColor {
        get {
            return UIColor(cgColor: layer.borderColor!)
        }
        set {
            layer.borderColor = newValue.cgColor
        }
    }
    
    public func makeRounded(radius: CGFloat) {
        self.clipsToBounds = true
        self.layer.cornerRadius = radius
    }
    
    public func makeColorRounded(_ radius: CGFloat, _ width: CGFloat, _ color: UIColor) {
        self.makeRounded(radius: radius)
        layer.borderWidth = width
        layer.borderColor = color.cgColor
    }
    
    func makeTopRounded(radius: CGFloat) {
        self.clipsToBounds = true
        self.layer.cornerRadius = radius.adjusted
        self.layer.maskedCorners = CACornerMask(arrayLiteral: .layerMinXMinYCorner, .layerMaxXMinYCorner)
    }
    
    func setCellShadow(backView: UIView) {
        backView.backgroundColor = .gray50
        backView.layer.masksToBounds = true
        backView.layer.cornerRadius = 12
        layer.masksToBounds = false
        layer.shadowColor = UIColor.gray400.cgColor
        layer.shadowOffset = CGSize(width: 0, height: 0)
        layer.shadowOpacity = 1
        layer.shadowRadius = 2.5
    }
}
