//
//  NetworkResult.swift
//  KeepGoEat-iOS
//
//  Created by 양정연 on 2022/12/27.
//

import Foundation

enum NetworkResult<T> {
    case success(T)
    case requestErr(T)
    case authErr(T)
    case serverErr(T)
    case pathErr
    case networkFail
}
