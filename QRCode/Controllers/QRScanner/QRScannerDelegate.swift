//
//  QRScannerDelegate.swift
//  QRCode
//
//  Created by Pienaar Anker on 2021/01/31.
//

import Foundation
import Contacts

protocol QRScannerDelegate: class {
    func qrScanningSucceeded(with contact: CNContact)
}
