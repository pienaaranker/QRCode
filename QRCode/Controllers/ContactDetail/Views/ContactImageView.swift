//
//  ContactImageView.swift
//  QRCode
//
//  Created by Pienaar Anker on 2021/01/29.
//

import UIKit

class ContactImageView: UIImageView {
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        clipsToBounds = true
        contentMode = .scaleToFill
        layer.cornerRadius = bounds.width / 2
        
        layer.borderColor = UIColor.white.cgColor
        layer.borderWidth = 4
    }

}
