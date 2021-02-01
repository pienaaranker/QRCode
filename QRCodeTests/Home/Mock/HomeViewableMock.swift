//
//  HomeViewableMock.swift
//  QRCodeTests
//
//  Created by Pienaar Anker on 2021/02/01.
//

import Foundation
import Contacts
@testable import QRCode

class HomeViewableMock: HomeViewable {
    
    var showContactsPickerCalled = false
    var navigateToContactDetailsCalled = false
    var openCameraCalled = false
    var showContactDetailsCalled = false
    
    func showContactsPicker() {
        showContactsPickerCalled = true
    }
    
    func navigateToContactDetails(with contact: CNContact) {
        navigateToContactDetailsCalled = true
    }    
    
    func openCamera() {
        openCameraCalled = true
    }
    
    func showContactDetails(contact: CNContact) {
        showContactDetailsCalled = true
    }
    
    func reset() {
        showContactsPickerCalled = false
        navigateToContactDetailsCalled = false
        openCameraCalled = false
        showContactDetailsCalled = false
    }
}
