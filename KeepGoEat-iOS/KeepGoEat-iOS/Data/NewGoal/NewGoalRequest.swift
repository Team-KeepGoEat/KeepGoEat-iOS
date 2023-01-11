//
//  NewGoalRequest.swift
//  KeepGoEat-iOS
//
//  Created by 양정연 on 2022/12/27.
//

import Foundation

struct NewGoalRequestDto: Codable {
    var goalContent: String
    var isMore: Bool
}
