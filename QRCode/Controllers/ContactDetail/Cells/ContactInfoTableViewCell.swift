//
//  ContactInfoTableViewCell.swift
//  QRCode
//
//  Created by Pienaar Anker on 2021/01/30.
//

import UIKit

class ContactInfoTableViewCell: UITableViewCell {

    @IBOutlet weak var keyLabel: UILabel!
    @IBOutlet weak var valueLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        keyLabel.font = Theme.Labels.standardFont
        keyLabel.textColor = Theme.Labels.textColor
        
        valueLabel.font = Theme.Labels.standardFont
        valueLabel.textColor = Theme.Labels.textColor
    }
    
    func set(key: String, value: String) {
        keyLabel.text = key
        valueLabel.text = value
    }
}
