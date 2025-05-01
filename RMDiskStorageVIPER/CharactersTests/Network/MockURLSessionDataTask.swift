//
//  MockURLSessionDataTask.swift
//  RMDiskStorageVIPER
//
//  Created by Ибрагим Габибли on 01.05.2025.
//

import Foundation
@testable import RMDiskStorageVIPER

final class MockURLSessionDataTask: URLSessionDataTaskProtocol {
    private let completion: (() -> Void)?
    private(set) var resumeCallCount = 0

    init(completion: (() -> Void)?) {
        self.completion = completion
    }

    func resume() {
        resumeCallCount += 1
        completion?()
    }
}
