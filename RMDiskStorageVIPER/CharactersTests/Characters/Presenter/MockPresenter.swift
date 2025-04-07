//
//  MockCharactersPresenter.swift
//  RMDiskStorageVIPER
//
//  Created by Ибрагим Габибли on 07.04.2025.
//

import XCTest
@testable import RMDiskStorageVIPER

final class MockPresenter: CharactersPresenterProtocol {
    private(set) var fetchedCharacters: [Character]?
    private(set) var fetchError: Error?
    private(set) var viewDidLoadCalled = false

    func viewDidLoad() {
        viewDidLoadCalled = true
    }

    func charactersFetched(_ characters: [Character]) {
        fetchedCharacters = characters
    }

    func charactersFetchFailed(with error: Error) {
        fetchError = error
    }
}
