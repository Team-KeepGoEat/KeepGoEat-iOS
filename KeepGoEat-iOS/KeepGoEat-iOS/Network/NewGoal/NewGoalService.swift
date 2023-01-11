//
//  NewGoalService.swift
//  KeepGoEat-iOS
//
//  Created by 양정연 on 2022/12/27.
//

import Foundation
import Moya

final class NewGoalService {
    static let shared = NewGoalService()
    private let newGoalProvider = MoyaProvider<NewGoalRouter>(plugins: [NetworkLoggerPlugin()])
    private init() { }
}

extension NewGoalService {
    func createNewGoal(body: NewGoalRequestDto) {
        newGoalProvider.request(.createGoal(body: body)) { response in
            switch response {
            case .success(let data):
                let status = data.statusCode
                let data = data.data
                let networkData = NetworkBase.judgeStatus(by: status, data, NewGoalResponseDto.self)
                switch networkData {
                case .success(let result):
                    guard let result = result as? NewGoalResponseDto else { return }
                    print(result)
                case .requestErr(let error):
                    print(error)
                case .authErr(let error):
                    print(error)
                case .serverErr(let error):
                    print(error)
                case .pathErr:
                    print("pathErr")
                case .networkFail:
                    print("networkFailErr")
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    func editNewGoal(body: NewGoalEditRequestDto) {
        newGoalProvider.request(.editGoal(body: body)) { response in
            switch response {
            case .success(let data):
                let status = data.statusCode
                let data = data.data
                let networkData = NetworkBase.judgeStatus(by: status, data, NewGoalResponseDto.self)
                switch networkData {
                case .success(let result):
                    guard let result = result as? NewGoalResponseDto else { return }
                    print(result)
                case .requestErr(let error):
                    print(error)
                case .authErr(let error):
                    print(error)
                case .serverErr(let error):
                    print(error)
                case .pathErr:
                    print("pathErr")
                case .networkFail:
                    print("networkFailErr")
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}
