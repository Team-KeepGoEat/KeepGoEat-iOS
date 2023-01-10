//
//  LoginRequest.swift
//  KeepGoEat-iOS
//
//  Created by 양정연 on 2022/12/27.
//

import Foundation

struct LoginRequestDto: Codable {
    var platformAccessToken: String
    var platform: String
}
