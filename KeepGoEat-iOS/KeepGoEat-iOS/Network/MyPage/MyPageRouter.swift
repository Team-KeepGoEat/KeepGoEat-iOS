//
//  MyPageRouter.swift
//  KeepGoEat-iOS
//
//  Created by 정채은 on 2023/03/17.
//

import Moya

enum MyPageRouter {
    case myPage
}

extension MyPageRouter: BaseTargetType {
    
    var path: String {
        switch self {
        case .myPage:
            return URLConstant.myPage
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .myPage:
            return .get
        }
    }
    
    var task: Moya.Task {
        switch self {
        case .myPage:
            return .requestPlain
        }
    }
    
    var headers: [String: String]? {
        return NetworkConstant.tokenHeader
    }

}
