//
//  QRScannerViewController.swift
//  QRCode
//
//  Created by Pienaar Anker on 2021/01/31.
//

import UIKit
import Contacts

class QRScannerViewController: UIViewController, QRScannerViewable, QRScannerViewDelegate  {
    

    @IBOutlet weak var infoLabel: UILabel!
    @IBOutlet weak var qrScannerView: QRScannerView!
    
    var viewModel: QRScannerViewModel!
    var delegate: QRScannerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModel = QRScannerViewModel(viewable: self, delegate: delegate)

        configureLabels()
        configureQRScannerView()
    }
    
    func configureLabels() {
        infoLabel.text = QRScannerViewModel.Strings.infoLabel
        infoLabel.font = Theme.Labels.standardFont
        infoLabel.textColor = Theme.Labels.textColorLight
    }
    
    func configureQRScannerView() {
        qrScannerView.delegate = self
    }
    
    // MARK: - Viewable
    
    func dismissViewController(with contact: CNContact) {
        self.dismiss(animated: true) {
            self.viewModel.contactFound(with: contact)
        }
    }
    
    // MARK: - QRScanner Delegate
    func qrScanningDidFail() {
        
    }
    
    func qrScanningSucceededWithCode(string: String?) {
        qrScannerView.stopScanning()
        viewModel.importContact(vcfBase64String: string)
    }
    
    func qrScanningDidStop() {
        
    }
}
