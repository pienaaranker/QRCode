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
    
    func navigateToContactDetails(with contact: CNContact) {
        self.performSegue(withIdentifier: HomeViewModel.Strings.homeToDetailSegue, sender: contact)
    }
    
    func openCamera() {
        self.performSegue(withIdentifier: HomeViewModel.Strings.homeToQRScanner, sender: nil)
    }
    
    // MARK: - Actions
    @IBAction func shareContact(_ sender: Any) {
        viewModel.shareContact()
    }
    
    @IBAction func importContact(_ sender: Any) {
        viewModel.openCamera()
    }
    
    // MARK: - Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let detailVC = segue.destination as? ContactDetailTableViewController,
              let contact = sender as? CNContact else {
            return
        }
        detailVC.contact = contact
        
    }
}

extension HomeViewController: CNContactPickerDelegate {
    func contactPicker(_ picker: CNContactPickerViewController, didSelect contact: CNContact) {
        viewModel.selectedContactToShare(contact: contact)
    }
}

extension HomeViewController: QRScannerDelegate {
    func qrScanningDidFail() {
    }
    
    func qrScanningSucceeded(with contact: CNContact) {
    }
    
    func qrScanningDidStop() {
    }
}
