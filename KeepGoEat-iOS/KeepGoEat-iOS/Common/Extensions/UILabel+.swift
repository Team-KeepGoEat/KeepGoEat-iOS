//
//  UILabel+.swift
//  KeepGoEat-iOS
//
//  Created by 이승헌 on 2023/01/06.
//

import UIKit

extension UILabel {
    func setTextWithLineHeight(text: String?, lineHeight: CGFloat) {
        if let text = text {
            let style = NSMutableParagraphStyle()
            style.maximumLineHeight = lineHeight
            style.minimumLineHeight = lineHeight
            
            let attributes: [NSAttributedString.Key: Any] = [
            .paragraphStyle: style,
            .baselineOffset: (lineHeight - font.lineHeight) * 0.26
            ]
                
            let attrString = NSAttributedString(string: text,
                                                attributes: attributes)
            self.attributedText = attrString
            self.textAlignment = .center
            self.numberOfLines = 2
        }
    }
}
