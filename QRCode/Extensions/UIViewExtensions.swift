//
//  UIViewExtensions.swift
//  QRCode
//
//  Created by Pienaar Anker on 2021/01/31.
//

import Foundation
import UIKit

extension UIView {
        
    func setGradient(startColor: UIColor, endColor: UIColor) {
        let gradientLayer:CAGradientLayer = CAGradientLayer()
        gradientLayer.frame.size = self.frame.size
        gradientLayer.colors = [startColor.cgColor, endColor.cgColor]
        gradientLayer.startPoint = CGPoint.zero
        gradientLayer.endPoint = CGPoint(x: 1, y: 1)
       
        self.layer.insertSublayer(gradientLayer, at: 0)
    }
}
