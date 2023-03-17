//
//  HomeResponse.swift
//  KeepGoEat-iOS
//
//  Created by 양정연 on 2022/12/27.
//

import Foundation

// MARK: - GetHomeResponse
struct GetHomeResponse: Codable {
    let goals: [Goal]
    let goalCount: Int
    let cheeringMessage: String
    let daytime: Int
}

// MARK: Goal
struct Goal: Codable {
    let goalId: Int
    let isMore: Bool
    let isOngoing: Bool
    let totalCount: Int
    let startedAt: String
    let keptAt: String
    let isAchieved: Bool
    let writerId: Int
    let thisMonthCount: Int
    let food: String
    let criterion: String
}

// MARK: - PostGoalAchieveResponse
struct PostGoalAchieveResponse: Codable {
    let thisMonthCount: Int
    let goalId: Int
    let updatedIsAchieved: Bool
}

let gethomeDataList: [GetHomeResponse] = [
    GetHomeResponse(goals: [], goalCount: 0, cheeringMessage: "오늘도 0개 행복하게 내일 더 멋지게!", daytime: 0),
    GetHomeResponse(goals: [
        Goal(goalId: 1, isMore: true, isOngoing: true, totalCount: 7, startedAt: "2022. 08.10", keptAt: "", isAchieved: false, writerId: 1, thisMonthCount: 6, food: "하루 한 번 유산균", criterion: "")
    ], goalCount: 1, cheeringMessage: "오늘도 1개 행복하게 내일 더 멋지게!", daytime: 1),
    GetHomeResponse(goals: [
        Goal(goalId: 1, isMore: true, isOngoing: true, totalCount: 7, startedAt: "2022. 08.10", keptAt: "", isAchieved: false, writerId: 1, thisMonthCount: 6, food: "하루 한 번 유산균", criterion: ""),
        Goal(goalId: 1, isMore: false, isOngoing: true, totalCount: 7, startedAt: "2022. 08.10", keptAt: "", isAchieved: true, writerId: 1, thisMonthCount: 6, food: "군것질거리", criterion: "")
    ], goalCount: 2, cheeringMessage: "오늘도 2개 행복하게 내일 더 멋지게!", daytime: 2),
    GetHomeResponse(goals: [
        Goal(goalId: 1, isMore: true, isOngoing: true, totalCount: 7, startedAt: "2022. 08.10", keptAt: "", isAchieved: false, writerId: 1, thisMonthCount: 6, food: "하루 한 번 유산균", criterion: ""),
        Goal(goalId: 1, isMore: false, isOngoing: true, totalCount: 7, startedAt: "2022. 08.10", keptAt: "", isAchieved: true, writerId: 1, thisMonthCount: 6, food: "군것질거리", criterion: ""),
        Goal(goalId: 1, isMore: false, isOngoing: true, totalCount: 7, startedAt: "2022. 08.10", keptAt: "", isAchieved: true, writerId: 1, thisMonthCount: 6, food: "룰루랄라", criterion: "")
    ], goalCount: 3, cheeringMessage: "오늘도 3개 행복하게 내일 더 멋지게!", daytime: 1)
]
