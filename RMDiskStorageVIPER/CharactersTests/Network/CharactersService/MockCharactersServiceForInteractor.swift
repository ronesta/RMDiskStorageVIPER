//
//  MockCharactersServiceForPresenter.swift
//  RMDiskStorageVIPER
//
//  Created by Ибрагим Габибли on 06.04.2025.
//

import Foundation
@testable import RMDiskStorageVIPER

final class MockCharactersServiceForInteractor: CharactersServiceProtocol {
    var getCharactersCalled = false
    var resultToReturn: Result<[Character], Error>?

    func getCharacters(completion: @escaping (Result<[Character], Error>) -> Void) {
        getCharactersCalled = true
        if let result = resultToReturn {
            completion(result)
        }
    }
}
