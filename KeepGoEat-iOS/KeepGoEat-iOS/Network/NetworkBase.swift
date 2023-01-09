//
//  NetworkBase.swift
//  KeepGoEat-iOS
//
//  Created by 양정연 on 2022/12/30.
//

import Foundation

struct NetworkBase {
    static func judgeStatus<T: Codable>(by statusCode: Int, _ data: Data, _ t: T.Type) -> NetworkResult<Any> {
        let decoder = JSONDecoder()
        guard let decodedData = try? decoder.decode(GeneralResponse<T>.self, from: data)
        else { return .pathErr }
        switch statusCode {
        case 200, 201:
            return .success(decodedData.data)
        case 202..<300:
            return .success(decodedData.message)
        case 400, 402...500:
            return .requestErr(decodedData.message)
        case 401:
            return .authErr(decodedData.message)
        case 500:
            return .serverErr(decodedData.message)
        default:
            return .networkFail
        }
    }
}
