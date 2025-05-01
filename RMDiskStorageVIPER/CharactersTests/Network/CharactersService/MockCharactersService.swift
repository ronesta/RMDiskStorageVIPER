//
//  MockCharactersServiceForPresenter.swift
//  RMDiskStorageVIPER
//
//  Created by Ибрагим Габибли on 06.04.2025.
//

import Foundation
@testable import RMDiskStorageVIPER

final class MockCharactersService: CharactersServiceProtocol {
    private(set) var getCharactersCallCount = 0
    private(set) var getCharactersCompletions = [(Result<[Character], Error>) -> Void]()

    var stubbedCharactersResult: Result<[Character], Error>?

    func getCharacters(completion: @escaping (Result<[Character], Error>) -> Void) {
        getCharactersCallCount += 1
        getCharactersCompletions.append(completion)

        if let result = stubbedCharactersResult {
            completion(result)
        }
    }
}
