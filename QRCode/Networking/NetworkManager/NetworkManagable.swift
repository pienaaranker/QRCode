//
//  NetworkManagable.swift
//  WeatherApp
//
//  Created by Pienaar Anker on 2020/12/21.
//

import Foundation

protocol NetworkManagable {
    func performGetRequest(url: URL, completion: @escaping (Data?, Error?) -> Void)
}
