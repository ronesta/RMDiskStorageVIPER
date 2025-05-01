//
//  MockCharactersView.swift
//  RMDiskStorageVIPER
//
//  Created by Ибрагим Габибли on 06.04.2025.
//

@testable import RMDiskStorageVIPER

final class MockCharactersView: CharactersViewInputProtocol {
    private(set) var characters: [Character]?
    private(set) var errorMessage: String?

    func displayCharacters(_ characters: [Character]) {
        self.characters = characters
    }

    func displayError(_ message: String) {
        errorMessage = message
    }
}
