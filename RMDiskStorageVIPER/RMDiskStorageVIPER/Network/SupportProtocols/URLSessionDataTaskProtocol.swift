//
//  URLSessionDataTaskProtocol.swift
//  RMDiskStorageVIPER
//
//  Created by Ибрагим Габибли on 01.05.2025.
//

import Foundation

protocol URLSessionDataTaskProtocol {
    func resume()
}

extension URLSessionDataTask: URLSessionDataTaskProtocol {}
