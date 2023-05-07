//
//  LoginService.swift
//  KeepGoEat-iOS
//
//  Created by 양정연 on 2022/12/27.
//

import Foundation

import Moya

final class LoginService {
    static let shared = LoginService()
    private let loginProvider = MoyaProvider<LoginRouter>(plugins: [MoyaLoggingPlugin()])
    private init() { }
}

extension LoginService {
    func postSocialLogin(param: LoginRequestDto, completion: @escaping (LoginResponseDto?) -> Void) {
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
                    completion(data)
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
    
    func refreshToken() {
        loginProvider.request(.refresh) { response in
            switch response {
            case .success(let result):
                let status = result.statusCode
                let data = result.data
                let networkData = NetworkBase.judgeStatus(by: status, data, RefreshResponseDto.self)
                switch networkData {
                case .success(let data):
                    guard let data = data as? RefreshResponseDto else { return }
                    updateUserTokenOnKeyChain(tokenName: Const.String.userAccessToken, tokenContent: data.accessToken)
                    updateUserTokenOnKeyChain(tokenName: Const.String.userRefreshToken, tokenContent: data.refreshToken)
                case .requestErr(let data):
                    guard let data = data as? String else { return }
                    print(data)
                    // refresh token 만료, 로그아웃(토큰삭제) 시키고 로그인뷰로 화면전환
                    RootViewControllerSwithcer.shared.changeRootViewController(navigationMode: .login)
                    deleteUserTokenOnKeyChain(tokenName: Const.String.userAccessToken)
                    deleteUserTokenOnKeyChain(tokenName: Const.String.userRefreshToken)
                    deleteSocialType()
                case .pathErr:
                    print("path error")
                case .serverErr:
                    print("server error")
                case .networkFail:
                    print("network fail error")
                case .authErr(let data):
                    guard let data = data as? String else { return }
                    print(data)
                    RootViewControllerSwithcer.shared.changeRootViewController(navigationMode: .login)
                    deleteUserTokenOnKeyChain(tokenName: Const.String.userAccessToken)
                    deleteUserTokenOnKeyChain(tokenName: Const.String.userRefreshToken)
                    deleteSocialType()
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    func withdraw(code: String?, completion: @escaping (String) -> Void) {
        loginProvider.request(.withdraw(code: code)) { response in
            switch response {
            case .success(let result):
                let status = result.statusCode
                let data = result.data
                let networkData = NetworkBase.judgeStatusWithdraw(by: status, data)
                switch networkData {
                case .success(let data):
                    guard let data = data as? String else { return }
                    completion(data)
                    print("success")
                case .requestErr(_):
                    print("request error")
                case .authErr(_):
                    print("auth error")
                case .serverErr(_):
                    print("server error")
                case .pathErr:
                    print("path error")
                case .networkFail:
                    print("network fail error")
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}
