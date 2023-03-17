//
//  MyPageResponse.swift
//  KeepGoEat-iOS
//
//  Created by 정채은 on 2023/03/17.
//

import Foundation

struct MyPageResponseDto: Codable {
    var name: String
    var email: String
    var keptGoalsCount: Int
}
