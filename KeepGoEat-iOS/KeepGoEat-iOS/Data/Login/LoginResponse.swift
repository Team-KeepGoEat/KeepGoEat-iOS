//
//  LoginResponse.swift
//  KeepGoEat-iOS
//
//  Created by 양정연 on 2022/12/27.
//

import Foundation

struct LoginResponseDto: Codable {
    let type: String
    let email: String
    let accessToken: String
    let refreshToken: String
}

struct RefreshResponseDto: Codable {
    let accessToken: String
    let refreshToken: String
}

struct GeneralWithdrawResponse: Codable {
    var status: Int
    var success: Bool
    var message: String
}
