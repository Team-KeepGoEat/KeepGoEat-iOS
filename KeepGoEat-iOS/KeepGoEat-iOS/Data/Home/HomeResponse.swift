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
    let dayTime: Int
}

// MARK: Goal
struct Goal: Codable {
    let goalID: Int
    let goalContent: String
    let isMore: Bool
    let isOngoing: Bool
    let totalCount: Int
    let startedAt: String
    let keptAt: String
    let isAchieved: Bool
    let writerID: Int
    let thisMonthCount: Int
}

let gethomeDataList: [GetHomeResponse] = [
    GetHomeResponse(goals: [], goalCount: 0, cheeringMessage: "오늘도 0개 행복하게 내일 더 멋지게!", dayTime: 0),
    GetHomeResponse(goals: [
        Goal(goalID: 1, goalContent: "하루 한 번 유산균", isMore: true, isOngoing: true, totalCount: 7, startedAt: "2022. 08.10", keptAt: "", isAchieved: false, writerID: 1, thisMonthCount: 6)
    ], goalCount: 1, cheeringMessage: "오늘도 1개 행복하게 내일 더 멋지게!", dayTime: 1),
    GetHomeResponse(goals: [
        Goal(goalID: 1, goalContent: "하루 한 번 유산균", isMore: true, isOngoing: true, totalCount: 7, startedAt: "2022. 08.10", keptAt: "", isAchieved: false, writerID: 1, thisMonthCount: 6),
        Goal(goalID: 1, goalContent: "군것질거리", isMore: true, isOngoing: true, totalCount: 7, startedAt: "2022. 08.10", keptAt: "", isAchieved: true, writerID: 1, thisMonthCount: 6)
    ], goalCount: 2, cheeringMessage: "오늘도 2개 행복하게 내일 더 멋지게!", dayTime: 2),
    GetHomeResponse(goals: [
        Goal(goalID: 1, goalContent: "하루 한 번 유산균", isMore: true, isOngoing: true, totalCount: 7, startedAt: "2022. 08.10", keptAt: "", isAchieved: false, writerID: 1, thisMonthCount: 6),
        Goal(goalID: 1, goalContent: "군것질거리", isMore: true, isOngoing: true, totalCount: 7, startedAt: "2022. 08.10", keptAt: "", isAchieved: true, writerID: 1, thisMonthCount: 6),
        Goal(goalID: 1, goalContent: "하루 한 번 유산균", isMore: true, isOngoing: true, totalCount: 7, startedAt: "2022. 08.10", keptAt: "", isAchieved: false, writerID: 1, thisMonthCount: 6)
    ], goalCount: 3, cheeringMessage: "오늘도 3개 행복하게 내일 더 멋지게!", dayTime: 1)
]
