//
//  StoreGoalRouter.swift
//  KeepGoEat-iOS
//
//  Created by 양정연 on 2022/12/30.
//

import Moya

enum StoreGoalRouter {
    case getStoreGoal(sortType: String)
}

extension StoreGoalRouter: BaseTargetType {
    var path: String {
        switch self {
        case .getStoreGoal:
            return URLConstant.storeGoal
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .getStoreGoal:
            return .get
        }
    }
    
    var task: Moya.Task {
        switch self {
        case .getStoreGoal(let sortType):
            return .requestParameters(parameters: ["sort": sortType], encoding: URLEncoding.default)
        }
    }
    
    var headers: [String: String]? {
        return NetworkConstant.accessTokenHeader
    }
    
}
