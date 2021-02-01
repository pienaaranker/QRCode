//
//  ContactDetailViewableMock.swift
//  QRCodeTests
//
//  Created by Pienaar Anker on 2021/02/01.
//

import Foundation
@testable import QRCode

class ContactDetailViewableMock: ContactDetailViewable {
    
    var errorShown: String?
    var buttonState: Bool?
    var hideContactImageViewCalled = false
    var reloadTableViewCalled = false
    
    func showError(message: String) {
        errorShown = message
    }
    
    func changeStateOfShareButton(enabled: Bool) {
        buttonState = enabled
    }
    
    func hideContactImageView() {
        hideContactImageViewCalled = true
    }
    
    func reloadTableView() {
        reloadTableViewCalled = true
    }
    
    func reset() {
        errorShown = nil
        buttonState = nil
        hideContactImageViewCalled = false
        reloadTableViewCalled = false
    }
}
