//
//  MockCharactersView.swift
//  RMDiskStorageVIPER
//
//  Created by Ибрагим Габибли on 06.04.2025.
//

@testable import RMDiskStorageVIPER

final class MockCharactersView: CharactersViewInputProtocol {
    private(set) var displayCharactersCallCount = 0
    private(set) var displayCharactersArgsCharacters = [[Character]]()

    private(set) var displayErrorCallCount = 0
    private(set) var displayErrorArgsMessages = String()

    func displayCharacters(_ characters: [Character]) {
        displayCharactersCallCount += 1
        displayCharactersArgsCharacters.append(characters)
    }

    func displayError(_ message: String) {
        displayErrorCallCount += 1
        displayErrorArgsMessages.append(message)
    }
}
