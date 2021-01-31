//
//  QRCodeManagable.swift
//  QRCode
//
//  Created by Pienaar Anker on 2021/01/30.
//

import Foundation

protocol QRCodeManagerDelegate: class {
    func fetchQRCodeSucceeded(with imageData: Data)
    func fetchQRCodeFailed(with error: QRError)
}
