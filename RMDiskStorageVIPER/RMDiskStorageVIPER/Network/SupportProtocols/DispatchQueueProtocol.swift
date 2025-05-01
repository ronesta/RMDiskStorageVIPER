//
//  DispatchQueueProtocol.swift
//  RMDiskStorageVIPER
//
//  Created by Ибрагим Габибли on 01.05.2025.
//

import Foundation

protocol DispatchQueueProtocol {
    func async(_ block: @escaping () -> Void)
}

extension DispatchQueue: DispatchQueueProtocol {
    func async(_ block: @escaping () -> Void) {
        async(execute: block)
    }
}
