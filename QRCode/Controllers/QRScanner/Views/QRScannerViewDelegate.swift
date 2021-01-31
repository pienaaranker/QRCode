//
//  QRScannerViewDelegate.swift
//  QRCode
//
//  Created by Pienaar Anker on 2021/01/31.
//

import Foundation

protocol QRScannerViewDelegate: class {
    func qrScanningDidFail()
    func qrScanningSucceededWithCode(string: String?)
    func qrScanningDidStop()
}
