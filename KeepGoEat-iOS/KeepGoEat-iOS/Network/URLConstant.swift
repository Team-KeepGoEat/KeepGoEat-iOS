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
    
    // MARK: Login
    static let postSocialLogin = "/auth"
    
    // MARK: Home
    
    // MARK: GoalDetail
    static let getGoalDetail = "/history/"
    static let deleteGoal = "/goal/"
    static let saveGoal = "/goal/keep/"
    
    // MARK: NewGoal
    static let NewGoal = "/goal"
    
    // MARK: StoreGoal
    
}
