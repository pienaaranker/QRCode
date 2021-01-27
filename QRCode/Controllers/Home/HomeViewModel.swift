//
//  HomeViewModel.swift
//  QRCode
//
//  Created by Pienaar Anker on 2021/01/27.
//

import Foundation

class HomeViewModel {
    
    weak var viewable: HomeViewable?
    
    init(viewable: HomeViewable) {
        self.viewable = viewable
    }
    
    func shareContact() {
        viewable?.showContactsPicker()
    }
}
