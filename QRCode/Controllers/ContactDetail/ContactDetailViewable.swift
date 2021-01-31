//
//  ContactDetailViewable.swift
//  QRCode
//
//  Created by Pienaar Anker on 2021/01/28.
//

import Foundation
import UIKit

protocol ContactDetailViewable: class {
    func showError(message: String)
    func changeStateOfShareButton(enabled: Bool)
    func hideContactImageView()
    func reloadTableView()
}
