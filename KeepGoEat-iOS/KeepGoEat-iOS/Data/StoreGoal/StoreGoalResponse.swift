//
//  StoreGoalResponse.swift
//  KeepGoEat-iOS
//
//  Created by 양정연 on 2022/12/30.
//

import Foundation

// MARK: - GetStoreGoalResponse
struct GetStoreGoalResponse: Codable {
    let goals: [StoreGoal]
    let goalCount: Int
}

// MARK: Goal
struct StoreGoal: Codable {
    let goalID: Int
    let goalContent: String
    let isMore, isOngoing: Bool
    let writerID, totalCount: Int
    let startedAt, keptAt: String
    let isAchieved: Bool
}
