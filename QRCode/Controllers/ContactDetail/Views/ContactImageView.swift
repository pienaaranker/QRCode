//
//  ContactImageView.swift
//  QRCode
//
//  Created by Pienaar Anker on 2021/01/29.
//

import UIKit

class ContactImageView: UIImageView {
    
    override var image: UIImage? {
        didSet {
            image == nil ? removeStyling() : addStyling()
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        clipsToBounds = true
        contentMode = .scaleToFill
    }
    
    func addStyling() {
        layer.cornerRadius = bounds.width / 2
        layer.borderColor = UIColor.white.cgColor
        layer.borderWidth = 4
    }
    
    func removeStyling() {
        layer.cornerRadius = 0
        layer.borderColor = nil
        layer.borderWidth = 0
    }

}
