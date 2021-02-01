//
//  JSONHelper.swift
//  WeatherAppTests
//
//  Created by Pienaar Anker on 2020/12/21.
//

import Foundation

class FileHelper {
    static func fetchData(in file:String) throws -> Data {
        let path = Bundle(for:self).path(forResource: file, ofType: "")
        return try Data(contentsOf: URL(fileURLWithPath: path!), options: .mappedIfSafe)
    }
}
