//
//  MockDispatchQueue.swift
//  RMDiskStorageVIPER
//
//  Created by Ибрагим Габибли on 01.05.2025.
//

import Foundation
@testable import RMDiskStorageVIPER

final class MockDispatchQueue: DispatchQueueProtocol {
    func async(_ block: @escaping () -> Void) {
        block()
    }
}
