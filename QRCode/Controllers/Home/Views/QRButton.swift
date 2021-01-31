//
//  QRButton.swift
//  QRCode
//
//  Created by Pienaar Anker on 2021/01/31.
//

import UIKit

class QRButton: UIButton {
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        layer.cornerRadius = 16        
        backgroundColor = Theme.Buttons.backgroundColor
        setTitleColor(Theme.Buttons.titleColor, for: .normal)
        titleLabel?.font = Theme.Labels.standardFont
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        showAnimation {}
    }

}
