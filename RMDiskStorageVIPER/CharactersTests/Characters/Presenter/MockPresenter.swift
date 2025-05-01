//
//  MockCharactersPresenter.swift
//  RMDiskStorageVIPER
//
//  Created by Ибрагим Габибли on 07.04.2025.
//

import XCTest
@testable import RMDiskStorageVIPER

final class MockPresenter: CharactersInteractorOutputProtocol {
    private(set) var charactersFetchedCallCount = 0
    private(set) var charactersFetchedArgsCharacters = [[Character]]()

    private(set) var charactersFetchFailedCallCount = 0
    private(set) var charactersFetchFailedArgsErrors = [Error]()

    private(set) var viewDidLoadCallCount = 0

    func viewDidLoad() {
        viewDidLoadCallCount += 1
    }

    func charactersFetched(_ characters: [Character]) {
        charactersFetchedCallCount += 1
        charactersFetchedArgsCharacters.append(characters)
    }

    func charactersFetchFailed(with error: Error) {
        charactersFetchFailedCallCount += 1
        charactersFetchFailedArgsErrors.append(error)
    }
}
