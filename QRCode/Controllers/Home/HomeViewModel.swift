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
        static let homeToQRScanner = "showQRScanner"
        static let title = "Contact QR Code Generator"
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
    
    func openCamera() {
        viewable?.openCamera()
    }
    
    func showContactDetails(contact: CNContact) {
        viewable?.showContactDetails(contact: contact)
    }
}
