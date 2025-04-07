//
//  MockCharactersPresenter.swift
//  RMDiskStorageVIPER
//
//  Created by Ибрагим Габибли on 07.04.2025.
//

import XCTest
@testable import RMDiskStorageVIPER

final class MockCharactersPresenter: CharactersPresenterProtocol {
    var fetchedCharacters: [Character]?
    var fetchError: Error?

    func viewDidLoad() {
        ""
    }

    func charactersFetched(_ characters: [Character]) {
        fetchedCharacters = characters
    }

    func charactersFetchFailed(with error: Error) {
        fetchError = error
    }
}
