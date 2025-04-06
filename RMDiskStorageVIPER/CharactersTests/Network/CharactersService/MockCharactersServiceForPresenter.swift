//
//  MockCharactersServiceForPresenter.swift
//  RMDiskStorageVIPER
//
//  Created by Ибрагим Габибли on 06.04.2025.
//

import Foundation
@testable import RMDiskStorageVIPER

final class MockCharactersServiceForPresenter: CharactersServiceProtocol {
    var shouldReturnError = false
    var characters = [Character]()

    func getCharacters(completion: @escaping (Result<[Character], Error>) -> Void) {
        if shouldReturnError {
            let error = NSError(domain: "Test", code: 0, userInfo: nil)
            completion(.failure(error))
        } else {
            completion(.success(characters))
        }
    }
}
