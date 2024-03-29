//
//  URLConstant.swift
//  KeepGoEat-iOS
//
//  Created by 양정연 on 2022/12/27.
//

import Foundation

struct URLConstant {
    
    // MARK: Base
    static let baseURL = Bundle.main.infoDictionary?["BASE_URL"] as! String
    
    // MARK: Auth
    static let postSocialLogin = "/auth"
    static let refreshToken = "/auth/refresh"
    static let withdraw = "/auth/withdraw"
    
    // MARK: Home
    static let getHome = "/home"
    static let postGoalAchieve = "/goal/achieve/"
    
    // MARK: GoalDetail
    static let getGoalDetail = "/history/"
    static let deleteGoal = "/goal/"
    static let saveGoal = "/goal/keep/"
    
    // MARK: NewGoal
    static let newGoal = "/goal"
    static let editGoal = "/goal/"
    
    // MARK: StoreGoal
    static let storeGoal = "/goal/kept"
    
    // MARK: MyPage
    static let myPage = "/mypage"
}
