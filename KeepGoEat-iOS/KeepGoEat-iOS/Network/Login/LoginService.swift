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
    
    func withdraw(code: String?, completion: @escaping (String) -> Void) {
        loginProvider.request(.withdraw(code: code)) { response in
            switch response {
            case .success(let result):
                let status = result.statusCode
                let data = result.data
                let decoder = JSONDecoder()
                guard let decodedData = try? decoder.decode(GeneralWithdrawResponse.self, from: data) else { return }
                switch status {
                case 200..<300:
                    print("success")
                    print(decodedData.message)
                    completion(decodedData.message)
                case 400, 402...500:
                    print("request error")
                    print(decodedData.message)
                case 401:
                    print("auth error")
                    print(decodedData.message)
                case 500:
                    print("server error")
                    print(decodedData.message)
                default:
                    print(decodedData.message)
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}
