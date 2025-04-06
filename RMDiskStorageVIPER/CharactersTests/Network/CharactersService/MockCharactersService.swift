//
//  MockCharactersService.swift
//  RMDiskStorageVIPER
//
//  Created by Ибрагим Габибли on 06.04.2025.
//

import Foundation
@testable import RMDiskStorageVIPER

final class MockCharactersService: CharactersServiceProtocol {
    var mockResult: Result<[Character], Error>?

    func getCharacters(completion: @escaping (Result<[Character], Error>) -> Void) {
        if let result = mockResult {
            completion(result)
        }
    }

    func getCharactersWithInvalidJSON(completion: @escaping (Result<[Character], Error>) -> Void) {
        let invalidJSON = "".data(using: .utf8)!

        do {
            let _ = try JSONDecoder().decode(PostCharacters.self, from: invalidJSON)
            completion(.success([]))
        } catch {
            completion(.failure(error))
        }
    }
}
