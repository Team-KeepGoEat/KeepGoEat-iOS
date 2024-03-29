//
//  GoalDetailRouter.swift
//  KeepGoEat-iOS
//
//  Created by 양정연 on 2022/12/27.
//

import Moya

enum GoalDetailRouter {
    case getGoalDetail(goalId: Int)
    case deleteGoal(goalId: Int)
    case saveGoal(goalId: Int)
}

extension GoalDetailRouter: BaseTargetType {
    var path: String {
        switch self {
        case .getGoalDetail(goalId: let goalId):
            return URLConstant.getGoalDetail + String(goalId)
        case .deleteGoal(goalId: let goalId):
            return URLConstant.deleteGoal + String(goalId)
        case .saveGoal(goalId: let goalId):
            return URLConstant.saveGoal + String(goalId)
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .getGoalDetail:
            return .get
        case .deleteGoal:
            return .delete
        case .saveGoal:
            return .post
        }
    }
    
    var task: Moya.Task {
        switch self {
        case .getGoalDetail:
            return .requestPlain
        case .deleteGoal:
            return .requestPlain
        case .saveGoal:
            return .requestPlain
        }
    }
    
    var headers: [String: String]? {
        return NetworkConstant.tokenHeader
    }
}
