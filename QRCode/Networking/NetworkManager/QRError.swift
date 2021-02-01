//
//  QRError.swift
//  QRCode
//
//  Created by Pienaar Anker on 2021/01/30.
//

import Foundation

enum QRError: Error {
    case callFailed
    case connectionIssue
    
    var description: String {
        switch self {
        case .callFailed:
            return "Fetching the QRCode for your contact failed."
        case .connectionIssue:
            return "Failed to connect. Please check your internet connection"
        }
    }
}
