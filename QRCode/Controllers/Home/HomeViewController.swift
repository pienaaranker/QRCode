//
//  HomeViewController.swift
//  QRCode
//
//  Created by Pienaar Anker on 2021/01/27.
//

import UIKit
import ContactsUI

class HomeViewController: UIViewController, HomeViewable {

    var viewModel: HomeViewModel!
    override func viewDidLoad() {
        super.viewDidLoad()

        viewModel = HomeViewModel(viewable: self)
    }
    
    // MARK: - Viewable
    
    func showContactsPicker() {
        let contactsPicker = CNContactPickerViewController()
        contactsPicker.delegate = self
        self.present(contactsPicker, animated: true, completion: nil)
    }
    
    // MARK: - Actions
    @IBAction func shareContact(_ sender: Any) {
        viewModel.shareContact()
    }
    
    @IBAction func importContact(_ sender: Any) {
    }
}

extension HomeViewController: CNContactPickerDelegate {
    func contactPicker(_ picker: CNContactPickerViewController, didSelect contact: CNContact) {
        print(contact)
    }
}
