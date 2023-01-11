//
//  HomeService.swift
//  KeepGoEat-iOS
//
//  Created by 양정연 on 2022/12/27.
//

import Moya

final class HomeService {
    static let shared = HomeService()
    private let homeProvider = MoyaProvider<HomeRouter>(plugins: [MoyaLoggingPlugin()])
    private init() { }
}

extension HomeService {
    func getHome(completion: @escaping (GetHomeResponse?) -> Void) {
        homeProvider.request(.getHome) { response in
            switch response {
            case .success(let result):
                let status = result.statusCode
                let data = result.data
                let networkData = NetworkBase.judgeStatus(by: status, data, GetHomeResponse.self)
                switch networkData {
                case .success(let data):
                    guard let data = data as? GetHomeResponse else { return }
                    completion(data)
                case .requestErr(let data):
                    guard let data = data as? String else { return }
                    print(data)
                case .authErr(let data):
                    guard let data = data as? String else { return }
                    print(data)
                case .serverErr(let data):
                    guard let data = data as? String else { return }
                    print(data)
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
