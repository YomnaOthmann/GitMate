//
//  SecureStoreQueryable.swift
//  GitMate
//
//  Created by Yomna Othman on 20/05/2024.
//

import Foundation
import Security

protocol SecureStoreQueryable{
    var query: [String: Any] { get }
    
}

public struct GenericPasswordQueryable{
    let accessGroup: String?
    let service: String
    
    init(accessGroup: String? = nil, service: String) {
        self.accessGroup = accessGroup
        self.service = service
    }
}

extension GenericPasswordQueryable : SecureStoreQueryable{
    var query: [String: Any]{
        var query: [String: Any] = [:]
        
        query[String(kSecClass)] = kSecClassGenericPassword
        query[String(kSecAttrService)] = service
        
        #if !targetEnvironment(simulator)
        if let accessGroup = accessGroup{
            query[String(kSecAttrAccessGroup)] = accessGroup
        }
        #endif
        return query
    }
}
