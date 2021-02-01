//
//  ContactDetailViewModelTests.swift
//  QRCodeTests
//
//  Created by Pienaar Anker on 2021/02/01.
//

import XCTest
@testable import QRCode

class ContactDetailViewModelTests: XCTestCase {

    var sut: ContactDetailViewModel!
    var mockViewable: ContactDetailViewableMock!
    var mockNetworkManager: NetworkManagableMock!

    override func setUpWithError() throws {
        mockViewable = ContactDetailViewableMock()
        mockNetworkManager = NetworkManagableMock()
        sut = ContactDetailViewModel(viewable: mockViewable, contact: ContactGenerator.generateBasicContact())
        sut.qrCodeManager?.networkManager = mockNetworkManager
    }

    override func tearDownWithError() throws {
        mockViewable.reset()
        mockNetworkManager.reset()
    }
    
    func testGetContactDisplayNameForNameWithGivenMiddleAndFamilyName() throws {
        sut = ContactDetailViewModel(viewable: mockViewable, contact: ContactGenerator.generateBasicContact())
        XCTAssertEqual(sut.getContactDisplayName(), "Sam George Stevenson")
    }
    
    func testGetContactDisplayNameForNameWithGivenAndFamilyName() throws {
        sut = ContactDetailViewModel(viewable: mockViewable, contact: ContactGenerator.generateContactWithGivenAndFamilyName())
        XCTAssertEqual(sut.getContactDisplayName(), "Sam Stevenson")
    }
    
    func testGetContactDisplayNameForNameWithGivenAndMiddleName() throws {
        sut = ContactDetailViewModel(viewable: mockViewable, contact: ContactGenerator.generateContactWithGivenAndMiddleName())
        XCTAssertEqual(sut.getContactDisplayName(), "Sam George")
    }
    
    func testGetContactDisplayNameForNameWithOnlyGivenName() throws {
        sut = ContactDetailViewModel(viewable: mockViewable, contact: ContactGenerator.generateContactWithOlnyGivenName())
        XCTAssertEqual(sut.getContactDisplayName(), "Sam")
    }
    
    func testGetContactImageWhereImageIsNil() {
        let image = sut.getContactImage()
        XCTAssertEqual(image, nil)
        XCTAssert(mockViewable.hideContactImageViewCalled)
    }
    
    func testGetContactImageWhereContactHasAnImage() {
        sut = ContactDetailViewModel(viewable: mockViewable, contact: ContactGenerator.generateContactWithImage())
        let image = sut.getContactImage()
        XCTAssertNotEqual(image, nil)
        XCTAssert(!mockViewable.hideContactImageViewCalled)
    }
    
    func testNumberOfSections() {
        XCTAssertEqual(sut.numberOfSections(), 2)
    }
    
    func testNumberOfRowsInSection() {
        XCTAssertEqual(sut.numberOfRows(in: 0), 2)
        XCTAssertEqual(sut.numberOfRows(in: 1), 1)
        XCTAssertEqual(sut.numberOfRows(in: 2), 0)
    }
    
    func testGetPhoneNumberInfo() {
        XCTAssertEqual(sut.getPhoneNumberInfo(for: 0), "(073) 954 6625")
        XCTAssertEqual(sut.getPhoneNumberInfo(for: 1), "(074) 254 1102")
    }
    
    func testGenerateQRCodeSuccess() {
        mockNetworkManager.isSuccess = true
        sut.generateQRCode()
                
        XCTAssertNotNil(sut.qrCode)
        XCTAssert(mockViewable.buttonState == true)
        XCTAssert(mockViewable.reloadTableViewCalled)
    }
    
    func testGenerateQRCodeError() {
        mockNetworkManager.isFailure = true
        sut.generateQRCode()
        
        XCTAssertEqual(mockViewable.errorShown, "Fetching the QRCode for your contact failed.")
    }

}
