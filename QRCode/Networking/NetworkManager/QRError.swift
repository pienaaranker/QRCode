//
//  QRError.swift
//  QRCode
//
//  Created by Pienaar Anker on 2021/01/30.
//

import Foundation

enum QRError: Error {
    case callFailed
    case contactTooLarge
    case connectionIssue
    
    var description: String {
        switch self {
        case .callFailed:
            return "Fetching the QRCode for your contact failed."
        case .contactTooLarge:
            return "Fetching the QRCode for your contact failed. Your contact might have too much stored information to fit inside a QRCode, try sharing another contact"
        case .connectionIssue:
            return "Failed to connect. Please check your internet connection"
        }
    }
}
