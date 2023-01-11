//
//  NewGoalRouter.swift
//  KeepGoEat-iOS
//
//  Created by 양정연 on 2022/12/27.
//

import Moya

enum NewGoalRouter {
    case createGoal(body: NewGoalRequestDto)
    case editGoal(body: NewGoalEditRequestDto, param: Int)
}

extension NewGoalRouter: BaseTargetType {
    var path: String {
        switch self {
        case .createGoal:
            return URLConstant.NewGoal
        case .editGoal(_, param: let param):
            return URLConstant.editGoal + String(param)
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .createGoal:
            return .post
        case .editGoal:
            return .post
        }
    }
    
    var task: Moya.Task {
        switch self {
        case .createGoal(body: let body):
            return .requestParameters(parameters: try! body.asParameter(), encoding: JSONEncoding.default)
        case .editGoal(body: let body, _):
            return .requestParameters(parameters: try! body.asParameter(), encoding: JSONEncoding.default)
        }
    }
    
    var headers: [String: String]? {
            return NetworkConstant.accessTokenHeader
        }
    }
