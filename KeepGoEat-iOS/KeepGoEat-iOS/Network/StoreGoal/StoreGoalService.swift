//
//  StoreGoalService.swift
//  KeepGoEat-iOS
//
//  Created by 양정연 on 2022/12/30.
//

import Moya

final class StoreGoalService {
    static let shared = StoreGoalService()
    private let storeGoalProvider = MoyaProvider<StoreGoalRouter>(plugins: [MoyaLoggingPlugin()])
    private init() { }
}

extension StoreGoalService {
    func getStoreGoal(sortType: SortType, completion: @escaping (GetStoreGoalResponse?) -> Void) {
        storeGoalProvider.request(.getStoreGoal(sortType: sortType.rawValue)) { response in
            switch response {
            case .success(let result):
                let status = result.statusCode
                let data = result.data
                let networkData = NetworkBase.judgeStatus(by: status, data, GetStoreGoalResponse.self)
                switch networkData {
                case .success(let data):
                    guard let data = data as? GetStoreGoalResponse else { return }
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
