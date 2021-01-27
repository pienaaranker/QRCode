//
//  HomeViewController.swift
//  QRCode
//
//  Created by Pienaar Anker on 2021/01/27.
//

import UIKit

class HomeViewController: UIViewController, HomeViewable {

    var viewModel: HomeViewModel!
    override func viewDidLoad() {
        super.viewDidLoad()

        viewModel = HomeViewModel(viewable: self)
    }
    

}
