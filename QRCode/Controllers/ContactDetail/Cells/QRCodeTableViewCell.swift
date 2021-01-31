//
//  QRCodeTableViewCell.swift
//  QRCode
//
//  Created by Pienaar Anker on 2021/01/30.
//

import UIKit

class QRCodeTableViewCell: UITableViewCell {

    @IBOutlet weak var qrCodeImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.backgroundColor = Theme.TableViews.backgroundColor
        qrCodeImageView.layer.cornerRadius = 16
    }

    func set(image: UIImage?) {
        qrCodeImageView.image = image
    }
}
