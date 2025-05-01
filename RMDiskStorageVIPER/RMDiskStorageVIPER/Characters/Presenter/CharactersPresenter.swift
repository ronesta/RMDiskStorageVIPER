//
//  CharacterPresenter.swift
//  RMDiskStorageVIPER
//
//  Created by Ибрагим Габибли on 04.02.2025.
//

import Foundation

final class CharactersPresenter: CharactersInteractorOutputProtocol {
    weak var view: CharactersViewInputProtocol?

    private let interactor: CharactersInteractorInputProtocol

    init(interactor: CharactersInteractorInputProtocol) {
        self.interactor = interactor
    }

    func viewDidLoad() {
        interactor.getCharacters()
    }

    func charactersFetched(_ characters: [Character]) {
        view?.displayCharacters(characters)
    }

    func charactersFetchFailed(with error: Error) {
        view?.displayError("Failed to load characters: \(error.localizedDescription)")
    }
}
