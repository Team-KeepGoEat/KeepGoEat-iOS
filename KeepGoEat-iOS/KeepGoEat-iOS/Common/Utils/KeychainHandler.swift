//
//  KeychainHandler.swift
//  KeepGoEat-iOS
//
//  Created by 양정연 on 2022/12/27.
//

import Foundation

import SwiftKeychainWrapper

struct Credentials {
    var tokenName: String
    var tokenContent: String
}

struct KeychainHandler {
    static var shared = KeychainHandler()
    
    private let keychain = KeychainWrapper(serviceName: "keepGoEat", accessGroup: "jeongkite.KeepGoEat.keychainGroup")
    private let accessTokenKey = "accessToken"
    private let refreshTokenKey = "refreshToken"

    var accessToken: String {
        get {
            return KeychainWrapper.standard.string(forKey: accessTokenKey) ?? ""
        }
        set {
            KeychainWrapper.standard.set(newValue, forKey: accessTokenKey)
        }
    }
    
    var refreshToken: String {
        get {
            return KeychainWrapper.standard.string(forKey: refreshTokenKey) ?? ""
        }
        set {
            KeychainWrapper.standard.set(newValue, forKey: refreshTokenKey)
        }
    }

    mutating func removeAll() {
        accessToken = ""
        refreshToken = ""
        KeychainWrapper.standard.removeObject(forKey: accessTokenKey)
        KeychainWrapper.standard.removeObject(forKey: refreshTokenKey)
    }
}

func addUserTokenOnKeyChain(tokenName: String, tokenContent: String) {
    let credentials = Credentials(tokenName: tokenName, tokenContent: tokenContent)
    let secretContent = credentials.tokenContent.data(using: String.Encoding.utf8)!
    let query: [CFString: Any] = [kSecClass: kSecClassGenericPassword, kSecAttrAccount: credentials.tokenName, kSecValueData: secretContent]
    
    let status = SecItemAdd(query as CFDictionary, nil)
    if status == errSecSuccess {
        print("Create Keychain Success")
    } else if status == errSecDuplicateItem {
        updateUserTokenOnKeyChain(tokenName: tokenName, tokenContent: tokenContent)
    } else {
        print("Create Keychain Fail")
    }
}

func updateUserTokenOnKeyChain(tokenName: String, tokenContent: String) {
    let previousQuery: [CFString: Any] = [kSecClass: kSecClassGenericPassword, kSecAttrAccount: tokenName]
    let updateQuery: [CFString: Any] = [kSecValueData: tokenContent.data(using: String.Encoding.utf8)!]
    let status = SecItemUpdate(previousQuery as CFDictionary, updateQuery as CFDictionary)

    if status == errSecSuccess {
        print("Update Keychain Success")
    } else {
        print("Update Keychain Fail")
    }
}

func readUserTokenOnKeyChain(tokenName: String) -> String {
    let query: [CFString: Any] = [kSecClass: kSecClassGenericPassword, kSecAttrAccount: tokenName, kSecReturnAttributes: true, kSecReturnData: true]
    
    var item: CFTypeRef?
    if SecItemCopyMatching(query as CFDictionary, &item) != errSecSuccess {
        print("Read Keychain Fail")
        return ""
    }
    
    guard let existingToken = item as? [String: Any] else { return "" }
    guard let data = existingToken[kSecValueData as String] as? Data else { return "" }
    guard let content = String(data: data, encoding: .utf8) else { return "" }
    
    return content
}

func deleteUserTokenOnKeyChain(tokenName: String) {
    let deleteQuery: [CFString: Any] = [kSecClass: kSecClassGenericPassword, kSecAttrAccount: tokenName]
    let status = SecItemDelete(deleteQuery as CFDictionary)
    if status == errSecSuccess {
        print("Delete Keychain Success")
    } else {
        print("Delete Keychain Fail")
    }
}

func isUserTokenOnKeyChain(tokenName: String) -> Bool {
    let query: [CFString: Any] = [kSecClass: kSecClassGenericPassword, kSecAttrAccount: tokenName, kSecReturnAttributes: true, kSecReturnData: true]
    
    var item: CFTypeRef?
    if SecItemCopyMatching(query as CFDictionary, &item) != errSecSuccess {
        print("Read Keychain Fail")
        return false
    }
    
    guard let existingToken = item as? [String: Any] else { return false }
    guard let data = existingToken[kSecValueData as String] as? Data else { return false }
    guard let _ = String(data: data, encoding: .utf8) else { return false }
    
    return true
}

func setUsername(username: String) {
    UserDefaults.standard.setValue(username, forKey: "username")
}

func getUsername() -> String {
    if let username = UserDefaults.standard.string(forKey: "username") {
        print("username: \(username)")
        return username
    } else {
        return ""
    }
}

func deleteUsername() {
    UserDefaults.standard.removeObject(forKey: "username")
}

func setEmail(userEmail: String) {
    UserDefaults.standard.setValue(userEmail, forKey: "userEmail")
}

func getEmail() -> String {
    if let userEmail = UserDefaults.standard.string(forKey: "userEmail") {
        print("userEmail: \(userEmail)")
        return userEmail
    } else {
        return ""
    }
}

func deleteEmail() {
    UserDefaults.standard.removeObject(forKey: "userEmail")
}

func setSocialType(socialType: SocialType) {
    UserDefaults.standard.setValue(socialType.rawValue, forKey: "socialType")
}

func getSocialType() -> String? {
    if let socialType = UserDefaults.standard.string(forKey: "socialType") {
        print("socialType: \(socialType)")
        return socialType
    } else {
        return nil
    }
}

func deleteSocialType() {
    UserDefaults.standard.removeObject(forKey: "socialType")
}

func isSocialType() -> Bool {
    if let type = UserDefaults.standard.string(forKey: "socialType") {
        print("socialType: \(type)")
        return true
    } else {
        print("socialType 없음")
        return false
    }
}

func isFirstTime() -> Bool {
    let defaults = UserDefaults.standard
    if defaults.object(forKey: "isFirstTime") == nil {
        defaults.set("No", forKey:"isFirstTime")
        return true
    } else {
        return false
    }
}
