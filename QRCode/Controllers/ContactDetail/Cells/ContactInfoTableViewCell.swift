//
//  ContactInfoTableViewCell.swift
//  QRCode
//
//  Created by Pienaar Anker on 2021/01/30.
//

import UIKit

class ContactInfoTableViewCell: UITableViewCell {

    @IBOutlet weak var valueLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
                
        self.backgroundColor = Theme.TableViews.backgroundColor
        valueLabel.font = Theme.Labels.standardFont
        valueLabel.textColor = Theme.Labels.textColorLight
    }
    
    func set(value: String) {
        valueLabel.text = value
    }
}
