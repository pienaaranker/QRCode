//
//  QRScannerDelegateMock.swift
//  QRCodeTests
//
//  Created by Pienaar Anker on 2021/02/01.
//

import Foundation
import Contacts
@testable import QRCode

class QRScannerDelegateMock: QRScannerDelegate {
    
    var scannedContact: CNContact?
    
    func qrScanningSucceeded(with contact: CNContact) {
        scannedContact = contact
    }
    
    func reset() {
        scannedContact = nil
    }
    
}
