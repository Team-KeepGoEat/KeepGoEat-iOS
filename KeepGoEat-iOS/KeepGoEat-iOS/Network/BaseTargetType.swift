//
//  BaseTargetType.swift
//  KeepGoEat-iOS
//
//  Created by 양정연 on 2023/01/08.
//

import Foundation

import Moya

protocol BaseTargetType: TargetType { }

extension BaseTargetType {

    var baseURL: URL {
        return URL(string: URLConstant.baseURL)!
    }
    
    var sampleData: Data {
        return Data()
    }
}
