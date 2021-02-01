//
//  NetworkMockDataGenerator.swift
//  QRCodeTests
//
//  Created by Pienaar Anker on 2021/02/01.
//

import Foundation
@testable import QRCode

class NetworkMockDataGenerator {
    static func generateError() -> QRError {
        return QRError.callFailed
    }
    
    static func generateQRCodeData() -> Data {
        let data = try! FileHelper.fetchData(in: "QRCodeData")
        var dataStr = String(data: data, encoding: .utf8)
        dataStr = dataStr!.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
        return Data(base64Encoded: dataStr!)!
    }
}
