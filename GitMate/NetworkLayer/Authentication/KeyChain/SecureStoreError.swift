//
//  SecureStoreError.swift
//  GitMate
//
//  Created by Yomna Othman on 20/05/2024.
//

import Foundation

enum SecureStoreError : Error{
    case string2DataCoversionError
    case data2StringCoversionError
    case unHandledError(message:String)
}

extension SecureStoreError : LocalizedError{
    
    public var errorDescription: String?{
        switch self{
        case .string2DataCoversionError:
            return NSLocalizedString("String to Data conversion error", comment: "")
        case .data2StringCoversionError:
            return NSLocalizedString("Data to Stirng conversion error", comment: "")
        case .unHandledError(let message):
            return NSLocalizedString(message, comment: "")
        }
    }
    
}
