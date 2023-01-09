//
//  NetworkConstant.swift
//  KeepGoEat-iOS
//
//  Created by 양정연 on 2022/12/30.
//

import Foundation

struct NetworkConstant {
    static let plainHeader = ["Content-Type": "application/json"]
    
    static let tokenHeader = ["Content-Type": "application/json", "accesstoken": readUserTokenOnKeyChain(tokenName: Const.String.userAccessToken), "refreshtoken": readUserTokenOnKeyChain(tokenName: Const.String.userRefreshToken)]
    
    static let accessTokenHeader = ["Content-Type": "application/json", "accesstoken": readUserTokenOnKeyChain(tokenName: Const.String.userAccessToken)]
}
