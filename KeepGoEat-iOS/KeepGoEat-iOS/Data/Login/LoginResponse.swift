//
//  LoginResponse.swift
//  KeepGoEat-iOS
//
//  Created by 양정연 on 2022/12/27.
//

import Foundation

struct LoginResponseDto: Codable {
    var type: String
    var email: String
    var accessToken: String
    var refreshToken: String
}
