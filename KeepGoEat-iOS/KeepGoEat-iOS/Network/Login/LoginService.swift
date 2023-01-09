//
//  LoginService.swift
//  KeepGoEat-iOS
//
//  Created by 양정연 on 2022/12/27.
//

import Moya

final class LoginService {
    static let shared = LoginService()
    private let loginProvider = MoyaProvider<LoginRouter>(plugins: [NetworkLoggerPlugin()])
    private init() { }
}

extension LoginService {
    func postSocialLogin(param: LoginRequestDto) {
        loginProvider.request(.socialLogin(param: param)) { response in
            switch response {
            case .success(let result):
                let status = result.statusCode
                let data = result.data
                let networkData = NetworkBase.judgeStatus(by: status, data, LoginResponseDto.self)
                switch networkData {
                case .success(let data):
                    guard let data = data as? LoginResponseDto else { return }
                    addUserTokenOnKeyChain(tokenName: Const.String.userAccessToken, tokenContent: data.accessToken)
                    addUserTokenOnKeyChain(tokenName: Const.String.userRefreshToken, tokenContent: data.refreshToken)
                    print(data)
                case .requestErr(let data):
                    guard let data = data as? String else { return }
                    print(data)
                case .pathErr:
                    print("path error")
                case .serverErr:
                    print("server error")
                case .networkFail:
                    print("network fail error")
                case .authErr(let data):
                    guard let data = data as? String else { return }
                    print(data)
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}
