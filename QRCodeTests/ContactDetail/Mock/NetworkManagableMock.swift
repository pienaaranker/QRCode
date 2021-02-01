//
//  NetworkManagableMock.swift
//  QRCodeTests
//
//  Created by Pienaar Anker on 2021/02/01.
//

import Foundation
@testable import QRCode

class NetworkManagableMock: NetworkManagable {
    
    var isSuccess = false
    var isFailure = false
    
    func performGetRequest(url: URL, completion: @escaping (Data?, QRError?) -> Void) {
        if isSuccess {
            completion(NetworkMockDataGenerator.generateQRCodeData(), nil)
        }
        
        if isFailure {
            completion(nil, NetworkMockDataGenerator.generateError())
        }
    }
    
    func reset() {
        isSuccess = false
        isFailure = false
    }
    
}
