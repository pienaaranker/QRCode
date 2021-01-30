//
//  HomeViewModel.swift
//  QRCode
//
//  Created by Pienaar Anker on 2021/01/27.
//

import Foundation
import Contacts

class HomeViewModel {
    
    struct Strings {
        static let homeToDetailSegue = "showContactDetail"
    }
    
    weak var viewable: HomeViewable?
    
    init(viewable: HomeViewable) {
        self.viewable = viewable
    }
    
    func shareContact() {
        viewable?.showContactsPicker()
    }
    
    func selectedContactToShare(contact: CNContact) {
        viewable?.navigateToContactDetails(with: contact)
    }
}
