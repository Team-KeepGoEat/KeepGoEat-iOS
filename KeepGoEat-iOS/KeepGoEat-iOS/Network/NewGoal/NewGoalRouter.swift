//
//  NewGoalRouter.swift
//  KeepGoEat-iOS
//
//  Created by 양정연 on 2022/12/27.
//

import Moya

enum NewGoalRouter {
    case createGoal(body: NewGoalRequestDto)
}

extension NewGoalRouter: BaseTargetType {
    var path: String {
        switch self {
        case .createGoal:
            return URLConstant.NewGoal
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .createGoal:
            return .post
        }
    }
    
    var task: Moya.Task {
        switch self {
        case .createGoal(body: let body):
            return .requestParameters(parameters: try! body.asParameter(), encoding: JSONEncoding.default)
        }
    }
    
    var headers: [String: String]? {
        switch self {
        case .createGoal:
            return NetworkConstant.accessTokenHeader
        }
    }
}
