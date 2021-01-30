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
        viewModel.generateQRCode()
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
        
    }
    
    @IBAction func share(_ sender: Any) {
        
    }
    
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return viewModel.numberOfSections()
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfRows(in: section)
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: ContactInfoTableViewCell.self)) as? ContactInfoTableViewCell else {
            return UITableViewCell()
        }
        let data = viewModel.getPhoneNumberInfo(for: indexPath.row)
        cell.set(key: data.key, value: data.value)
        
        return cell
    }

}
