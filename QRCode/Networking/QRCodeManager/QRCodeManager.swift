//
//  QRCodeManager.swift
//  QRCode
//
//  Created by Pienaar Anker on 2021/01/30.
//

import Foundation

class QRCodeManager {
    
    struct endPoints {
        private static let domain = "//chart.googleapis.com"
        
        static func chart(parameters: [String: String]) -> URL? {
            return NetworkManager.url(from: "\(domain)/chart", queryParameters: parameters)
        }
    }
    
    var networkManager: NetworkManagable = NetworkManager()
    private let delegate: QRCodeManagerDelegate?
    
    init(delegate: QRCodeManagerDelegate?) {
        self.delegate = delegate
    }
    
    func fetchQRCode(for dataString: String) {
        let request = QRCodeRequest(cht: "qr",
                                    chs: "200x200",
                                    chl: dataString,
                                    choe: "UTF-8")
        
        guard let parameters = request.toQueryDictionary(),
            let url = QRCodeManager.endPoints.chart(parameters: parameters) else {
            fatalError("Could not parse weather api to url")
        }
        
        networkManager.performGetRequest(url: url) { (data, error) in
            if let error = error {
                self.delegate?.fetchQRCodeFailed(with: error)
            } else if let data = data {
                self.delegate?.fetchQRCodeSucceeded(with: data)
            } else {
                self.delegate?.fetchQRCodeFailed(with: <#T##Error#>)
            }
        }
    }
}
