//
//  String+.swift
//  KeepGoEat-iOS
//
//  Created by 최가연 on 2023/01/05.
//

import Foundation

extension String {
    func hasCharacters() -> Bool {
        do {
            let regex = try NSRegularExpression(pattern: "^[ㄱ-ㅎ|ㅏ-ㅣ|가-힣|a-z|A-Z|0-9]+$", options: .caseInsensitive)
            if let _ = regex.firstMatch(in: self, options: NSRegularExpression.MatchingOptions.reportCompletion, range: NSMakeRange(0, self.count)) {
                return true
            }
        } catch {
            print(error.localizedDescription)
            return false
        }
        return false
    }
}
