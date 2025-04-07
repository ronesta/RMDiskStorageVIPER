//
//  CharacterInteractor.swift
//  RMDiskStorageVIPER
//
//  Created by Ибрагим Габибли on 04.02.2025.
//

import Foundation

final class CharactersInteractor: CharactersInteractorProtocol {
    weak var presenter: CharactersPresenterProtocol?

    private let charactersService: CharactersServiceProtocol
    private let storageManager: StorageManagerProtocol

    init(charactersService: CharactersServiceProtocol,
         storageManager: StorageManagerProtocol
    ) {
        self.charactersService = charactersService
        self.storageManager = storageManager
    }

    func getCharacters() {
        if let savedCharacters = storageManager.loadCharacters() {
            presenter?.charactersFetched(savedCharacters)
            return
        }

        charactersService.getCharacters { [weak self] result in
            switch result {
            case .success(let characters):
                self?.storageManager.saveCharacters(characters)
                self?.presenter?.charactersFetched(characters)
            case .failure(let error):
                self?.presenter?.charactersFetchFailed(with: error)
            }
        }
    }
}
