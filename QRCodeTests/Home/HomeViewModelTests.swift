//
//  HomeViewModelTests.swift
//  QRCodeTests
//
//  Created by Pienaar Anker on 2021/02/01.
//

import XCTest
import Contacts
@testable import QRCode

class HomeViewModelTests: XCTestCase {
    
    var sut: HomeViewModel!
    var mockViewable: HomeViewableMock!

    override func setUpWithError() throws {
        mockViewable = HomeViewableMock()
        sut = HomeViewModel(viewable: mockViewable)
    }

    override func tearDownWithError() throws {
        mockViewable.reset()
    }
    
    func testShareContact() throws {
        sut.shareContact()
        XCTAssert(mockViewable.showContactsPickerCalled)
    }
    
    func testSelectedContactToShare() throws {
        let contact = ContactGenerator.generateBasicContact()
        sut.selectedContactToShare(contact: contact)
        XCTAssert(mockViewable.navigateToContactDetailsCalled)
    }
    
    func testOpenCamera() throws {
        sut.openCamera()
        XCTAssert(mockViewable.openCameraCalled)
    }
    
    func testShowContactDetails() throws {
        let contact = ContactGenerator.generateBasicContact()
        sut.showContactDetails(contact: contact)
        XCTAssert(mockViewable.showContactDetailsCalled)
    }

}
