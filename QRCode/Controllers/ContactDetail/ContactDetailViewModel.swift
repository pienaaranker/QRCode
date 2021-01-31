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
    var qrCode: UIImage?
    var qrCodeURL: URL?
    
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
        guard let data = try? CNContactVCardSerialization.data(with: [contact]) else {
            return
        }
        qrCodeManager?.fetchQRCode(for: data.base64EncodedString())
    }
    
    // MARK: - QRCodeManager Delegate
    func fetchQRCodeSucceeded(with imageData: Data) {
        qrCode = UIImage(data: imageData)
        saveImageToTempDirectory(image: qrCode)
        viewable?.changeStateOfShareButton(enabled: true)
        viewable?.reloadTableView()
    }
    
    func fetchQRCodeFailed(with error: QRError) {
        viewable?.showError(message: error.description)
    }
    
    func saveImageToTempDirectory(image: UIImage?) {
        // Create a URL in the /tmp directory
        guard let imageURL = NSURL(fileURLWithPath: NSTemporaryDirectory()).appendingPathComponent("qrCode.png"),
               let image = image else {
            return
        }
        
        do {
            try image.pngData()?.write(to: imageURL)
            qrCodeURL = imageURL
        } catch {
            qrCodeURL = nil
        }
    }
    
}
