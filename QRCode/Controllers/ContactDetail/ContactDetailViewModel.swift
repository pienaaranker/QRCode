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
    
    struct Strings {
        static let title = "Contact Details"
    }
    
    weak var viewable: ContactDetailViewable?
    private var contact: CNContact
    var qrCodeManager: QRCodeManager?
    var qrCode: UIImage?
    
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
            viewable?.hideContactImageView()
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
    
    func getPhoneNumberInfo(for index: Int) -> String  {
        let data = contact.phoneNumbers[index]
        return data.value.stringValue
    }
    
    // MARK: - QRCode generation
    func generateQRCode() {
        guard let data = try? CNContactVCardSerialization.data(with: [contact]),
              let str = String(data: data, encoding: .utf8) else {
            return
        }
        qrCodeManager?.fetchQRCode(for: str)
    }
    
    // MARK: - QRCodeManager Delegate
    func fetchQRCodeSucceeded(with imageData: Data) {
        qrCode = UIImage(data: imageData)
        viewable?.changeStateOfShareButton(enabled: true)
        viewable?.reloadTableView()
    }
    
    func fetchQRCodeFailed(with error: QRError) {
        viewable?.showError(message: error.description)
    }
    
}
