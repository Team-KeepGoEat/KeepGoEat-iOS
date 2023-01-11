//
//  GoalDetailResponse.swift
//  KeepGoEat-iOS
//
//  Created by 양정연 on 2022/12/27.
//

import Foundation

struct GoalDetailResponseDto: Codable {
    var goalId: Int
    var isMore: Bool
    var thisMonthCount: Int
    var lastMonthCount: Int
    var goalContent: String
    var blankBoxCount: Int
    var emptyBoxCount: Int
}

struct GoalDeleteResponseDto: Codable {
    var goalId: Int
}
