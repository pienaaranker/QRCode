//
//  QRScannerViewable.swift
//  QRCode
//
//  Created by Pienaar Anker on 2021/01/31.
//

import Foundation
import Contacts

protocol QRScannerViewable: class {
    func dismissViewController(with contact: CNContact)
    func showError(message: String)
}
