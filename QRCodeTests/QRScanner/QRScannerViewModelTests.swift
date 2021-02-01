//
//  QRScannerViewModelTests.swift
//  QRCodeTests
//
//  Created by Pienaar Anker on 2021/02/01.
//

import XCTest
@testable import QRCode

class QRScannerViewModelTests: XCTestCase {

    
    var sut: QRScannerViewModel!
    var mockViewable: QRScannerViewableMock!
    var mockDelegate: QRScannerDelegateMock!

    override func setUpWithError() throws {
        mockViewable = QRScannerViewableMock()
        mockDelegate = QRScannerDelegateMock()
        sut = QRScannerViewModel(viewable: mockViewable, delegate: mockDelegate)
    }

    override func tearDownWithError() throws {
        mockViewable.reset()
        mockDelegate.reset()
    }
    
    func testImportContactWithValidVCFString() {
        let vcard = QRScannerMockDataGenerator.generateVCard()
        sut.importContact(vcfString: vcard)
        
        XCTAssertEqual(mockViewable.dismissViewControllerCalledWithContact?.givenName, "Anna 🎶")
    }
    
    func testImportContactWithInvalidVCFString() {
        sut.importContact(vcfString: "invalid string")
        
        XCTAssertNil(mockViewable.dismissViewControllerCalledWithContact)
    }

    func testContactFound() {
        sut.contactFound(with: ContactGenerator.generateBasicContact())
        
        XCTAssertEqual(mockDelegate.scannedContact?.givenName, "Sam")
    }
    
    func testScanningFailed() {
        sut.scanningFailed()
        
        XCTAssertEqual(mockViewable.errorShown, "Scanning for QR Code failed")
    }
}
