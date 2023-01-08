//
//  Encodable+.swift
//  KeepGoEat-iOS
//
//  Created by 이승헌 on 2023/01/08.
//

import Foundation

extension Encodable {
    func asParameter() throws -> [String: Any] {
        let data = try JSONEncoder().encode(self)
        guard let dictionary = try JSONSerialization.jsonObject(with: data, options: .allowFragments) as? [String: Any] else {
            throw NSError()
        }
        
        return dictionary
    }
}
