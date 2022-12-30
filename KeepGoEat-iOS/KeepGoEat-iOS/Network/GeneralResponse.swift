//
//  GeneralResponse.swift
//  KeepGoEat-iOS
//
//  Created by 양정연 on 2022/12/27.
//

import Foundation

struct GeneralResponse<T: Codable>: Codable {
    var status: Int
    var success: Bool
    var message: String
    var data: T?
}
