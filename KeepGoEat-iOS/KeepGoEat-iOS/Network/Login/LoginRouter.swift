//
//  LoginRouter.swift
//  KeepGoEat-iOS
//
//  Created by 양정연 on 2022/12/27.
//

import Moya

enum LoginRouter {
    case socialLogin(param: LoginRequestDto)
    case refresh
}

extension LoginRouter: BaseTargetType {
    var path: String {
        switch self {
        case .socialLogin:
            return URLConstant.postSocialLogin
        case .refresh:
            return URLConstant.refreshToken
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .socialLogin:
            return .post
        case .refresh:
            return .post
        }
    }
    
    var task: Moya.Task {
        switch self {
        case .socialLogin(param: let param):
            return .requestParameters(parameters: try! param.asParameter(), encoding: JSONEncoding.default)
        case .refresh:
            return .requestPlain
        }
    }
    
    var headers: [String: String]? {
        switch self {
        case .socialLogin:
            return NetworkConstant.plainHeader
        case .refresh:
            return NetworkConstant.tokenHeader
        }
    }
}
