//
//  ContactDetailViewModel.swift
//  QRCode
//
//  Created by Pienaar Anker on 2021/01/28.
//

import Foundation
import UIKit
import Contacts

class ContactDetailViewModel {
    
    weak var viewable: ContactDetailViewable?
    private var contact: CNContact
    
    init(viewable: ContactDetailViewable, contact: CNContact) {
        self.viewable = viewable
        self.contact = contact
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
        return 1
    }
    
    func numberOfRows(in section: Int) -> Int {
        return 1
    }
    
    
}
