//
//  KeychainHandler.swift
//  KeepGoEat-iOS
//
//  Created by 양정연 on 2022/12/27.
//

import Foundation

struct Credentials {
    var tokenName: String
    var tokenContent: String
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
