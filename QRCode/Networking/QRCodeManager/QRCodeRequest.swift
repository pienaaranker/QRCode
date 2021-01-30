//
//  QRCodeRequest.swift
//  QRCode
//
//  Created by Pienaar Anker on 2021/01/30.
//

import Foundation

struct QRCodeRequest: Encodable {
    var cht: String
    var chs: String
    var chl: String
    var choe: String
}
