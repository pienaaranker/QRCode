//
//  HomeViewable.swift
//  QRCode
//
//  Created by Pienaar Anker on 2021/01/27.
//

import Foundation
import Contacts

protocol HomeViewable: class {
    
    func showContactsPicker()
    func navigateToContactDetails(with contact: CNContact)
}
