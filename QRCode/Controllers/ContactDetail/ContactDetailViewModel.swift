//
//  ContactDetailViewModel.swift
//  QRCode
//
//  Created by Pienaar Anker on 2021/01/28.
//

import Foundation
import UIKit
import Contacts

class ContactDetailViewModel: QRCodeManagerDelegate {
    
    weak var viewable: ContactDetailViewable?
    private var contact: CNContact
    var qrCodeManager: QRCodeManager?
    
    init(viewable: ContactDetailViewable, contact: CNContact) {
        self.viewable = viewable
        self.contact = contact
    
        qrCodeManager = QRCodeManager(delegate: self)
    }
    
    // MARK: - TableView Header View
    func getContactDisplayName() -> String {
        var displayName = contact.givenName
        
        if !contact.middleName.isEmpty {
            displayName += " \(contact.middleName)"
        }
        
        if !contact.familyName.isEmpty {
            displayName += " \(contact.familyName)"
        }
        
        return displayName
    }
    
    func getContactImage() -> UIImage? {
        guard let imageData = contact.imageData else {
            return nil
        }
        
        return UIImage(data: imageData)
    }
    
    // MARK: - TableView Datasource
    func numberOfSections() -> Int {
        return 2
    }
    
    func numberOfRows(in section: Int) -> Int {
        switch section {
        case 0:
            return contact.phoneNumbers.count
        case 1:
            return 1
        default:
            return 0
        }
    }
    
    func getPhoneNumberInfo(for index: Int) -> (key: String, value: String)  {
        let data = contact.phoneNumbers[index]
        let key = CNLabeledValue<NSString>.localizedString(forLabel: data.label!)
        return (String(key), data.value.stringValue)
    }
    
    // MARK: - QRCode generation
    func generateQRCode() {
        guard let data = try? CNContactVCardSerialization.data(with: [contact]) else {
            return
        }
        qrCodeManager?.fetchQRCode(for: data.base64EncodedString())
    }
    
}
