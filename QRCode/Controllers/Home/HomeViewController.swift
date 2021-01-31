//
//  HomeViewController.swift
//  QRCode
//
//  Created by Pienaar Anker on 2021/01/27.
//

import UIKit
import ContactsUI

class HomeViewController: UIViewController, HomeViewable {
    @IBOutlet weak var titleLabel: UILabel!
    
    var viewModel: HomeViewModel!
    override func viewDidLoad() {
        super.viewDidLoad()

        viewModel = HomeViewModel(viewable: self)
        
        configureView()
        configureLabels()
        configureButtons()
    }
    
    func configureView() {
        view.setGradient(startColor: Theme.Views.secondaryColor, endColor: Theme.Views.secondaryGradient)
        navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
    func configureLabels() {
        titleLabel.text = HomeViewModel.Strings.title
        titleLabel.font = Theme.Labels.LargeFont
        titleLabel.textColor = Theme.Labels.textColorLight
    }
    
    func configureButtons() {
        
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
    
    func showContactDetails(contact: CNContact) {
        let contactDetailsVC = CNContactViewController(forNewContact: contact)
        contactDetailsVC.delegate = self
        let navigationController = UINavigationController(rootViewController: contactDetailsVC)
        self.present(navigationController, animated: true, completion: nil)
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
        
        switch segue.identifier {
        case HomeViewModel.Strings.homeToDetailSegue:
            guard let detailVC = segue.destination as? ContactDetailTableViewController,
                  let contact = sender as? CNContact else {
                return
            }
            detailVC.contact = contact
            
        case HomeViewModel.Strings.homeToQRScanner:
            guard let scannerVC = segue.destination as? QRScannerViewController else {
                return
            }
            scannerVC.delegate = self
            
        default:
            break
        }
        
        
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
        viewModel.showContactDetails(contact: contact)
    }
    
    func qrScanningDidStop() {
    }
}

extension HomeViewController: CNContactViewControllerDelegate {
    
    func contactViewController(_ viewController: CNContactViewController, didCompleteWith contact: CNContact?) {
        viewController.navigationController?.dismiss(animated: true, completion: nil)
    }
}
