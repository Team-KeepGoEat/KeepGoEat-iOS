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
    case withdraw(code: String?)
}

extension LoginRouter: BaseTargetType {
    var path: String {
        switch self {
        case .socialLogin:
            return URLConstant.postSocialLogin
        case .refresh:
            return URLConstant.refreshToken
        case .withdraw:
            return URLConstant.withdraw
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .socialLogin:
            return .post
        case .refresh:
            return .post
        case .withdraw:
            return .get
        }
    }
    
    var task: Moya.Task {
        switch self {
        case .socialLogin(param: let param):
            return .requestParameters(parameters: try! param.asParameter(), encoding: JSONEncoding.default)
        case .refresh:
            return .requestPlain
        case .withdraw(let code):
            return .requestParameters(parameters: ["code": code ?? "null"], encoding: URLEncoding.default)
        }
    }
    
    var headers: [String: String]? {
        switch self {
        case .socialLogin:
            return NetworkConstant.plainHeader
        case .refresh:
            return NetworkConstant.tokenHeader
        case .withdraw:
            return NetworkConstant.tokenHeader
        }
    }
}
