//
//  MockCharactersInteractor.swift
//  RMDiskStorageVIPER
//
//  Created by Ибрагим Габибли on 07.04.2025.
//

import XCTest
@testable import RMDiskStorageVIPER

final class MockInteractor: CharactersInteractorInputProtocol {
    private(set) var getCharactersCalled = false

    func getCharacters() {
        getCharactersCalled = true
    }
}
