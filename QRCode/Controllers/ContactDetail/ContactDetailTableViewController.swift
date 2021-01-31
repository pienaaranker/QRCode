//
//  ContactDetailTableViewController.swift
//  QRCode
//
//  Created by Pienaar Anker on 2021/01/29.
//

import UIKit
import Contacts

class ContactDetailTableViewController: UITableViewController, ContactDetailViewable {

    @IBOutlet weak var contactImageView: ContactImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var shareButton: UIBarButtonItem!
    
    var viewModel: ContactDetailViewModel!
    var contact: CNContact!
        
    override func viewDidLoad() {
        super.viewDidLoad()
        guard contact != nil else {
            fatalError("No contact was specified by parent view controller")
        }
        
        viewModel = ContactDetailViewModel(viewable: self, contact: contact)
        
        configureLabels()
        configureImageView()
        configureTableView()
        configureView()
        viewModel.generateQRCode()
    }
    
    func configureView() {
        navigationController?.setNavigationBarHidden(false, animated: true)
    }
    
    func configureButtons() {
        shareButton.isEnabled = false
    }
    
    func configureLabels() {
        nameLabel.text = viewModel.getContactDisplayName()
        nameLabel.font = Theme.Labels.LargeFont
        nameLabel.textColor = Theme.Labels.textColor
    }
    
    func configureImageView() {
        contactImageView.image = viewModel.getContactImage()
    }
    
    func configureTableView() {        
            tableView.rowHeight = UITableView.automaticDimension
            tableView.estimatedRowHeight = 60
            tableView.tableFooterView = UIView()
            tableView.sectionFooterHeight = 0.5
    }
    
    //MARK: - Viewable
    
    func showError(message: String) {
        showAlert(title: GlobalStrings.Alert.errorTitle, message: message, handler: nil)
    }
    
    func changeStateOfShareButton(enabled: Bool) {
        shareButton.isEnabled = enabled
    }
    
    func reloadTableView() {
        tableView.reloadData()
    }
    
    // MARK: - Actions
    @IBAction func share(_ sender: Any) {
        guard let image = viewModel.qrCode else {
            return
        }
        let activityViewController = UIActivityViewController(activityItems: [image], applicationActivities: nil)
        self.present(activityViewController, animated: true, completion: nil)
    }
    
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return viewModel.numberOfSections()
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfRows(in: section)
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
        case 0:
            return cellForPhoneNumber(indexPath: indexPath)
        case 1:
            return cellForQRCode()
        default:
            return UITableViewCell()
        }
    }
    
    func cellForPhoneNumber(indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: ContactInfoTableViewCell.self)) as? ContactInfoTableViewCell else {
            return UITableViewCell()
        }
        let data = viewModel.getPhoneNumberInfo(for: indexPath.row)
        cell.set(key: data.key, value: data.value)
        
        return cell
    }
    
    func cellForQRCode() -> UITableViewCell {        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: QRCodeTableViewCell.self)) as? QRCodeTableViewCell else {
            return UITableViewCell()
        }
        
        cell.set(image: viewModel.qrCode)
        
        return cell
    }

}
