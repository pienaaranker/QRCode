//
//  Theme.swift
//  QRCode
//
//  Created by Pienaar Anker on 2021/01/30.
//

import Foundation
import UIKit

class Theme {
    struct Labels {
        static let standardFont = UIFont(name: "Verdana", size: 17)
        static let LargeFont = UIFont(name: "Verdana", size: 28)
        static let textColor = UIColor.black
        static let textColorLight = UIColor.white
    }
    
    struct Views {
        static let primaryColor = UIColor(red: 0/255, green: 168/255, blue: 65/255, alpha: 1.0)
        static let primaryGradient = UIColor(red: 21/255, green: 111/255, blue: 39/255, alpha: 1.0)
        static let secondaryColor = UIColor(red: 24/255, green: 76/255, blue: 79/255, alpha: 1.0)
        static let secondaryGradient = UIColor(red: 20/255, green: 64/255, blue: 66/255, alpha: 1.0)
    }
    
    struct Buttons {
        static let backgroundColor = UIColor.white
        static let titleColor = UIColor.black
        static let shadowColor = UIColor.black.cgColor
    }
}
