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
struct StoreGoal: Codable, Hashable {
    let goalID: Int
    let goalContent: String
    let isMore, isOngoing: Bool
    let writerID, totalCount: Int
    let startedAt, keptAt: String
    let isAchieved: Bool
}

let getStoreGoalDataList: [GetStoreGoalResponse] = [
    GetStoreGoalResponse(goals: [], goalCount: 0),
    GetStoreGoalResponse(goals: [
        StoreGoal(goalID: 1, goalContent: "양상추", isMore: true, isOngoing: false, writerID: 1, totalCount: 25, startedAt: "2021. 04. 10", keptAt: "2023. 01. 04", isAchieved: false),
        StoreGoal(goalID: 2, goalContent: "야식", isMore: false, isOngoing: false, writerID: 1, totalCount: 16, startedAt: "2022. 12. 01", keptAt: "2022. 12. 31", isAchieved: false),
        StoreGoal(goalID: 3, goalContent: "물", isMore: true, isOngoing: false, writerID: 1, totalCount: 16, startedAt: "2022. 12. 01", keptAt: "2022. 12. 31", isAchieved: false),
        StoreGoal(goalID: 4, goalContent: "아침", isMore: true, isOngoing: false, writerID: 1, totalCount: 16, startedAt: "2022. 12. 01", keptAt: "2022. 12. 31", isAchieved: false),
        StoreGoal(goalID: 5, goalContent: "저녁 두 숟갈", isMore: false, isOngoing: false, writerID: 1, totalCount: 16, startedAt: "2022. 12. 01", keptAt: "2022. 12. 31", isAchieved: false)
    ], goalCount: 5)
]
