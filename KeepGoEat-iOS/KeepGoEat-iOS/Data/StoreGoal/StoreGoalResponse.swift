//
//  StoreGoalResponse.swift
//  KeepGoEat-iOS
//
//  Created by 양정연 on 2022/12/30.
//

import Foundation

// MARK: - StoreGoalResponseDto
struct StoreGoalResponseDto: Codable {
    var goalId: Int
}

// MARK: - GetStoreGoalResponse
struct GetStoreGoalResponse: Codable {
    let goals: [StoreGoal]
    let goalCount: Int
}

// MARK: Goal
struct StoreGoal: Codable, Hashable {
    let goalId: Int
    let goalContent: String
    let isMore: Bool
    let isOngoing: Bool
    let totalCount: Int
    let startedAt: String
    let keptAt: String
    let isAchieved: Bool
    let writerId: Int
}

let getStoreGoalDataList: [GetStoreGoalResponse] = [
    GetStoreGoalResponse(goals: [], goalCount: 0),
    GetStoreGoalResponse(goals: [
        StoreGoal(goalId: 1, goalContent: "양상추", isMore: true, isOngoing: false, totalCount: 275, startedAt: "2021. 04. 10", keptAt: "2023. 01. 04", isAchieved: false, writerId: 1),
        StoreGoal(goalId: 2, goalContent: "야식", isMore: false, isOngoing: false, totalCount: 38, startedAt: "2022. 11. 09", keptAt: "2022. 12. 31", isAchieved: false, writerId: 1),
        StoreGoal(goalId: 3, goalContent: "물", isMore: true, isOngoing: false, totalCount: 23, startedAt: "2022. 10. 14", keptAt: "2022. 12. 20", isAchieved: false, writerId: 1),
        StoreGoal(goalId: 4, goalContent: "아침", isMore: true, isOngoing: false, totalCount: 4, startedAt: "2022. 06. 04", keptAt: "2022. 09. 06", isAchieved: false, writerId: 1),
        StoreGoal(goalId: 5, goalContent: "저녁 두 숟갈", isMore: false, isOngoing: false, totalCount: 16, startedAt: "2022. 02. 06", keptAt: "2022. 04. 10", isAchieved: false, writerId: 1)
    ], goalCount: 5)
]
