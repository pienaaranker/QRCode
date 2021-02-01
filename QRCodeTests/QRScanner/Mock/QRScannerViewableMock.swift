//
//  QRScannerViewableMock.swift
//  QRCodeTests
//
//  Created by Pienaar Anker on 2021/02/01.
//

import Foundation
import Contacts
@testable import QRCode

class QRScannerViewableMock: QRScannerViewable {
    
    var dismissViewControllerCalledWithContact: CNContact?
    var errorShown: String?
    
    func dismissViewController(with contact: CNContact) {
        dismissViewControllerCalledWithContact = contact
    }
    
    func showError(message: String) {
        errorShown = message
    }
    
    func reset() {
        dismissViewControllerCalledWithContact = nil
        errorShown = nil
    }
}
