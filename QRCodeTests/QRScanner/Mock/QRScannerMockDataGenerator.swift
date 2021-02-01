//
//  QRScannerMockDataGenerator.swift
//  QRCodeTests
//
//  Created by Pienaar Anker on 2021/02/01.
//

import Foundation

class QRScannerMockDataGenerator {
    static func generateVCard() -> String {
        let data = try! FileHelper.fetchData(in: "VCard")
        return String(data: data, encoding: .utf8)!
    }
}
