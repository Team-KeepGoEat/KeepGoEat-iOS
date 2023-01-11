//
//  StoreGoalRouter.swift
//  KeepGoEat-iOS
//
//  Created by 양정연 on 2022/12/30.
//

import Moya

enum StoreGoalRouter {
    case getMypage(sortType: String)
}

extension StoreGoalRouter: BaseTargetType {
    var path: String {
        switch self {
        case .getMypage(sortType: let sortType):
            return URLConstant.storeGoal + sortType
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .getMypage:
            return .get
        }
    }
    
    var task: Moya.Task {
        switch self {
        case .getMypage:
            return .requestPlain
        }
    }
    
    var headers: [String : String]? {
        return NetworkConstant.accessTokenHeader
    }
    
    
}
