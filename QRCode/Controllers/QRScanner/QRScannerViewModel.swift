//
//  QRScannerViewModel.swift
//  QRCode
//
//  Created by Pienaar Anker on 2021/01/31.
//

import Foundation
import Contacts

class QRScannerViewModel {
    
    weak var viewable: QRScannerViewable?
    weak var delegate: QRScannerDelegate?
    
    init(viewable: QRScannerViewable, delegate: QRScannerDelegate?) {
        self.viewable = viewable
        self.delegate = delegate
    }
    
    struct Strings {
        static let infoLabel = "↓ Drag down to close ↓"
    }
    
    func importContact(vcfBase64String: String?) {
        guard let vcfBase64String = vcfBase64String,
              let data = Data(base64Encoded: vcfBase64String),
              let contact = try? CNContactVCardSerialization.contacts(with: data).first  else {
            return
        }
        
        viewable?.dismissViewController(with: contact)
    }
    
    func contactFound(with contact: CNContact) {
        delegate?.qrScanningSucceeded(with: contact)
    }
}
