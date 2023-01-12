//
//  HomeRouter.swift
//  KeepGoEat-iOS
//
//  Created by 양정연 on 2022/12/27.
//

import Moya

enum HomeRouter {
    case getHome
    case postGoalAchieve(body: PostGoalAchieveRequest, param: Int)
}

extension HomeRouter: BaseTargetType {
    var path: String {
        switch self {
        case .getHome:
            return URLConstant.getHome
        case .postGoalAchieve(_, param: let param):
            return URLConstant.postGoalAchieve + String(param)
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .getHome:
            return .get
        case .postGoalAchieve:
            return .post
        }
    }
    
    var task: Moya.Task {
        switch self {
        case .getHome:
            return .requestPlain
        case .postGoalAchieve(body: let body, param: _):
            return .requestParameters(parameters: try! body.asParameter(), encoding: JSONEncoding.default)
        }
    }
    
    var headers: [String: String]? {
        return NetworkConstant.accessTokenHeader
    }
}
