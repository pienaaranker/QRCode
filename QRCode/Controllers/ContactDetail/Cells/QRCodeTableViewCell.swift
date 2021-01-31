//
//  QRCodeTableViewCell.swift
//  QRCode
//
//  Created by Pienaar Anker on 2021/01/30.
//

import UIKit

class QRCodeTableViewCell: UITableViewCell {

    @IBOutlet weak var qrCodeImageView: UIImageView!
    @IBOutlet weak var loader: UIActivityIndicatorView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.backgroundColor = Theme.TableViews.backgroundColor
        
        qrCodeImageView.layer.cornerRadius = 16
        
        loader.startAnimating()
        loader.hidesWhenStopped = true
    }

    func set(image: UIImage?) {
        if image != nil {
            loader.stopAnimating()
        }
        qrCodeImageView.image = image
    }
}
