//
//  GoalDetailRouter.swift
//  KeepGoEat-iOS
//
//  Created by 양정연 on 2022/12/27.
//

import Moya

enum GoalDetailRouter {
    case getGoalDetail(goalId: Int)
}

extension GoalDetailRouter: BaseTargetType {
    var path: String {
        switch self {
        case .getGoalDetail(goalId: let goalId):
            return URLConstant.getGoalDetail + String(goalId)
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .getGoalDetail(goalId: _):
            return .get
        }
    }
    
    var task: Moya.Task {
        switch self {
        case .getGoalDetail(goalId: _):
            return .requestPlain
        }
    }
    
    var headers: [String: String]? {
        return NetworkConstant.accessTokenHeader
    }
}
