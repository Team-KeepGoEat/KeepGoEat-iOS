//
//  NetworkConstant.swift
//  KeepGoEat-iOS
//
//  Created by 양정연 on 2022/12/30.
//

import Foundation

struct NetworkConstant {
    static let plainHeader = ["Content-Type": "application/json"]
    
    static var tokenHeader = ["Content-Type": "application/json", "accesstoken": KeychainHandler.shared.accessToken, "refreshtoken": KeychainHandler.shared.refreshToken]
    
    static var accessTokenHeader = ["Content-Type": "application/json", "accesstoken": KeychainHandler.shared.accessToken]
}
