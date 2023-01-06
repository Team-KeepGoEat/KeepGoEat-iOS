//
//  NSMutableAttributedString+.swift
//  KeepGoEat-iOS
//
//  Created by 양정연 on 2023/01/06.
//

import UIKit

extension NSMutableAttributedString {
    
    /// 홈 목표 카드뷰의 달성 일자 강조 스타일을 설정해줍니다.
    func setCountTitleTextStyle(string: String, isMore: Bool) -> NSMutableAttributedString {
        let attributes:[NSAttributedString.Key : Any] = [
            .font: .systemCard,
            .foregroundColor: isMore ? .orange600 : .green600
        ]
        self.append(NSAttributedString(string: string, attributes: attributes))
        return self
    }
    
    /// 홈 목표 카드뷰의 달성 일자 안내 스타일을 설정해줍니다.
    func setCountSubTextStyle(string: String) -> NSMutableAttributedString {
        let attributes:[NSAttributedString.Key : Any] = [
            .font: .system3Bold,
            .foregroundColor: .gray700
        ]
        self.append(NSAttributedString(string: string, attributes: attributes))
        return self
    }
}
