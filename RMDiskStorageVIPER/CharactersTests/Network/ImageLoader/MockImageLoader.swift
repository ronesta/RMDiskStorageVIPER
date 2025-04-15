//
//  MockImageLoader.swift
//  RMDiskStorageVIPER
//
//  Created by Ибрагим Габибли on 06.04.2025.
//

import UIKit.UIImage
@testable import RMDiskStorageVIPER

final class MockImageLoader: ImageLoaderProtocol {
    var mockImage: UIImage?
    var shouldReturnError: Bool = false

    func loadImage(from urlString: String, completion: @escaping (UIImage?) -> Void) {
        if shouldReturnError {
            completion(nil)
        } else {
            completion(mockImage)
        }
    }
}
