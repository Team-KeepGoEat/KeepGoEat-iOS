//
//  LoginRouter.swift
//  KeepGoEat-iOS
//
//  Created by 양정연 on 2022/12/27.
//

import Moya

enum LoginRouter {
    case socialLogin(param: LoginRequestDto)
}

extension LoginRouter: BaseTargetType {
    var path: String {
        switch self {
        case .socialLogin:
            return URLConstant.postSocialLogin
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .socialLogin:
            return .post
        }
    }
    
    var task: Moya.Task {
        switch self {
        case .socialLogin(param: let param):
            return .requestParameters(parameters: try! param.asParameter(), encoding: JSONEncoding.default)
        }
    }
    
    var headers: [String: String]? {
        return NetworkConstant.plainHeader
    }
}
