//
//  HomeRouter.swift
//  KeepGoEat-iOS
//
//  Created by 양정연 on 2022/12/27.
//

import Moya

enum HomeRouter {
    case getHome
}

extension HomeRouter: BaseTargetType {
    var path: String {
        switch self {
        case .getHome:
            return URLConstant.getHome
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .getHome:
            return .get
        }
    }
    
    var task: Moya.Task {
        switch self {
        case .getHome:
            return .requestPlain
        }
    }
    
    var headers: [String: String]? {
        return NetworkConstant.accessTokenHeader
    }
}
