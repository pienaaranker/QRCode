//
//  NetworkManager.swift
//  WeatherApp
//
//  Created by Pienaar Anker on 2020/12/21.
//

import Foundation

class NetworkManager: NetworkManagable {
    
    func performGetRequest(url: URL, completion: @escaping (Data?, Error?) -> Void) {
        print("Performing request: \(url)")
        logRequest(url: url)

        let task = URLSession.shared.dataTask(with: url, completionHandler: { (data, response, error) in
            self.logResponse(data: data, response: response as? HTTPURLResponse, error: error)
            self.handleAPIResponse(data: data, response: response as? HTTPURLResponse, error: error, completion: completion)
        })

        task.resume()
    }
        
    func handleAPIResponse(data: Data?, response: HTTPURLResponse?, error: Error?, completion: (Data?, Error?) -> Void) {
        switch response!.statusCode {
        case 200...299:
            completion(data, nil)
        case 400...499:
            completion(nil, error)
        case 500:
            completion(nil, error)
        default:
            completion(nil, error)
        }
    }
    
    func logRequest(url: URL) {
        log("⚡️ API REQUEST")
        log("--------------------------------------")
        log(url)
        log("======================================")
    }
    
    func logResponse(data: Data?, response: HTTPURLResponse?, error: Error?) {
        guard let data = data else {
            return
        }
        if (200..<300).contains(response?.statusCode ?? 400) {
            log("✅ API RESPONSE SUCCESS")
            log("--------------------------------------")
            log(data.base64EncodedString() as Any)
            log("======================================")
            
        } else {
            log("🚩 API RESPONSE ERROR")
            log("--------------------------------------")
            log(error?.localizedDescription as Any)
            log("======================================")
        }
            
    }
    
    func log(_ items: Any) {
        print(items)
    }
    
    static func url(from urlString: String, queryParameters: [String: String]) -> URL? {
        guard let url = URL(string: urlString) else {
            return nil
        }
        var components = URLComponents(url: url, resolvingAgainstBaseURL: false)
        let queryItems = queryParameters.map({ URLQueryItem(name: $0.key, value:$0.value) })
        components?.scheme = "https"
        components?.queryItems = queryItems
        return components?.url
    }
}
