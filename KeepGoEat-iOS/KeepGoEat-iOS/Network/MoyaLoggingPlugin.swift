//
//  MoyaLoggingPlugin.swift
//  KeepGoEat-iOS
//
//  Created by 양정연 on 2022/12/30.
//

import Foundation

import Moya

final class MoyaLoggingPlugin: PluginType {
    func willSend(_ request: RequestType, target: TargetType) {
        #if DEBUG || DEV
        guard let httpRequest = request.request else {
            print("유효하지 않은 요청")
            return
        }
        let url = httpRequest.description
        let method = httpRequest.httpMethod ?? "unknown method"
        var log = "\n-----------------------------------------\n\n[\(method)] \(url)\n\n\n"
        log.append("API: \(target)\n")
        if let headers = httpRequest.allHTTPHeaderFields, !headers.isEmpty {
            log.append("header: \(headers)\n")
        }
        if let body = httpRequest.httpBody, let bodyString = String(bytes: body, encoding: String.Encoding.utf8) {
            log.append("\(bodyString)\n")
        }
        log.append("END \(method)\n-----------------------------------------\n\n")
        print(log)
        #endif
    }

    func didReceive(_ result: Result<Response, MoyaError>, target: TargetType) {
        #if DEBUG || DEV
        switch result {
        case let .success(response):
            onSuceed(response, target: target, isFromError: false)
        case let .failure(error):
            onFail(error, target: target)
        }
        #endif
    }

    func onSuceed(_ response: Response, target: TargetType, isFromError: Bool) {
        #if DEBUG || DEV
        let request = response.request
        let url = request?.url?.absoluteString ?? "nil"
        let statusCode = response.statusCode
        var log = "네트워크 통신 성공 🎉\n"
        log.append("[\(statusCode)] \(url)\n\n")
        log.append("API: \(target)\n")
        log.append("-----------------------------------------\n")
        response.response?.allHeaderFields.forEach {
            log.append("\($0): \($1)\n")
        }
        if let json = try? JSONSerialization.jsonObject(with: response.data, options: .mutableContainers),
           let jsonData = try? JSONSerialization.data(withJSONObject: json, options: .prettyPrinted) {
            log.append(String(decoding: jsonData, as: UTF8.self))
        } else {
            log.append("json data malformed")
        }
        log.append("\nEND HTTP (\(response.data.count)-byte body)\n\n-----------------------------------------")
        print(log)
        #endif
    }

    func onFail(_ error: MoyaError, target: TargetType) {
        #if DEBUG || DEV
        if let response = error.response {
            onSuceed(response, target: target, isFromError: true)
            return
        }
        var log = "네트워크 오류"
        log.append("-----------------------------------------\n\(error.errorCode) \(target)\n")
        log.append("\(error.failureReason ?? error.errorDescription ?? "unknown error")\n")
        log.append("\n-----------------------------------------\nEND HTTP")
        print(log)
        #endif
    }
}
