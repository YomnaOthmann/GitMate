//
//  AccessTokenEntity.swift
//  GitMate
//
//  Created by Yomna Othman on 13/05/2024.
//

import Foundation

struct AccessTokenEntity : Codable{
    let accessToken: String
    let tokenType: String
    
    enum CodingKeys : String, CodingKey{
        case accessToken = "access_token"
        case tokenType = "token_type"
    }
}
