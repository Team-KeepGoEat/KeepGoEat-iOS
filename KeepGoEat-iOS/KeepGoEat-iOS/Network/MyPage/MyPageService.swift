//
//  MyPageService.swift
//  KeepGoEat-iOS
//
//  Created by 정채은 on 2023/03/17.
//

import Moya

final class MyPageService {
    static let shared = MyPageService()
    private let myPageProvider = MoyaProvider<MyPageRouter>(plugins: [MoyaLoggingPlugin()])
    private init() { }
}

extension MyPageService {
    func getMyPage(completion: @escaping (MyPageResponseDto?) -> Void) {
        myPageProvider.request(.myPage) { response in
            switch response {
            case .success(let result):
                let status = result.statusCode
                let data = result.data
                let networkData = NetworkBase.judgeStatus(by: status, data, MyPageResponseDto.self)
                switch networkData {
                case .success(let data):
                    guard let data = data as? MyPageResponseDto else { return }
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
