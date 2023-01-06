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
}

// MARK: Goal
struct Goal: Codable {
    let goalID: Int
    let goalContent: String
    let isMore, isOngoing: Bool
    let writerID, totalCount: Int
    let startedAt, keptAt: String
    let isAchieved: Bool
    let thisMonthCount: Int
}

extension GetHomeResponse {
    static func setHomeDummy0() -> GetHomeResponse {
        return GetHomeResponse(goals: [], goalCount: 0, cheeringMessage: "오늘도 0개 행복하게 내일 더 멋지게!")
    }
    static func setHomeDummy1() -> GetHomeResponse {
        return GetHomeResponse(goals: [
            Goal(goalID: 1, goalContent: "하루 한 번 유산균", isMore: true, isOngoing: true, writerID: 1, totalCount: 7, startedAt: "2022. 08.10", keptAt: "", isAchieved: false, thisMonthCount: 6)
        ], goalCount: 1, cheeringMessage: "오늘도 1개 행복하게 내일 더 멋지게!")
    }
    static func setHomeDummy2() -> GetHomeResponse {
        return GetHomeResponse(goals: [
            Goal(goalID: 1, goalContent: "하루 한 번 유산균", isMore: true, isOngoing: true, writerID: 1, totalCount: 7, startedAt: "2022. 08.10", keptAt: "", isAchieved: false, thisMonthCount: 6),
            Goal(goalID: 3, goalContent: "군것질거리", isMore: false, isOngoing: true, writerID: 1, totalCount: 4, startedAt: "2022. 08.10", keptAt: "", isAchieved: false, thisMonthCount: 3)
        ], goalCount: 2, cheeringMessage: "오늘도 2개 행복하게 내일 더 멋지게!")
    }
    static func setHomeDummy3() -> GetHomeResponse {
        return GetHomeResponse(goals: [
            Goal(goalID: 1, goalContent: "하루 한 번 유산균", isMore: true, isOngoing: true, writerID: 1, totalCount: 7, startedAt: "2022. 08.10", keptAt: "", isAchieved: false, thisMonthCount: 6),
            Goal(goalID: 2, goalContent: "라면", isMore: false, isOngoing: true, writerID: 1, totalCount: 20, startedAt: "2022. 08.10", keptAt: "", isAchieved: false, thisMonthCount: 17),
            Goal(goalID: 3, goalContent: "군것질거리", isMore: false, isOngoing: true, writerID: 1, totalCount: 4, startedAt: "2022. 08.10", keptAt: "", isAchieved: false, thisMonthCount: 3)
        ], goalCount: 3, cheeringMessage: "오늘도 3개 행복하게 내일 더 멋지게!")
    }
}
