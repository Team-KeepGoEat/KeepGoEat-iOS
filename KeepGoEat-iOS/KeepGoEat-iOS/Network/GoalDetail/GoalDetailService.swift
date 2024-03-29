//
//  GoalDetailService.swift
//  KeepGoEat-iOS
//
//  Created by 양정연 on 2022/12/27.
//

import Moya

final class GoalDetailService {
    static let shared = GoalDetailService()
    private let goalDetailProvider = MoyaProvider<GoalDetailRouter>(plugins: [MoyaLoggingPlugin()])
    private init() { }
}

extension GoalDetailService {
    func getGoalDetail(goalId: Int, completion: @escaping (GoalDetailResponseDto?) -> Void) {
        goalDetailProvider.request(.getGoalDetail(goalId: goalId)) { response in
            switch response {
            case .success(let result):
                let status = result.statusCode
                let data = result.data
                let networkData = NetworkBase.judgeStatus(by: status, data, GoalDetailResponseDto.self)
                switch networkData {
                case .success(let data):
                    guard let data = data as? GoalDetailResponseDto else { return }
                    print(data)
                    completion(data)
                case .requestErr(let data):
                    guard let data = data as? String else { return }
                    print(data)
                case .pathErr:
                    print("path error")
                case .serverErr(let data):
                    guard let data = data as? String else { return }
                    print(data)
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
    
    func deleteGoal(goalId: Int, completion: @escaping (GoalDeleteResponseDto?) -> Void) {
        goalDetailProvider.request(.deleteGoal(goalId: goalId)) { response in
            switch response {
            case .success(let result):
                let status = result.statusCode
                let data = result.data
                let networkData = NetworkBase.judgeStatus(by: status, data, GoalDeleteResponseDto.self)
                switch networkData {
                case .success(let data):
                    guard let data = data as? GoalDeleteResponseDto else { return }
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
    
    func saveGoal(goalId: Int) {
        goalDetailProvider.request(.saveGoal(goalId: goalId)) { response in
            switch response {
            case .success(let result):
                let status = result.statusCode
                let data = result.data
                let networkData = NetworkBase.judgeStatus(by: status, data, StoreGoalResponseDto.self)
                switch networkData {
                case .success(let data):
                    guard let data = data as? StoreGoalResponseDto else { return }
                    print(data)
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
