//
//  CharacterInteractor.swift
//  RMDiskStorageVIPER
//
//  Created by Ибрагим Габибли on 04.02.2025.
//

import Foundation

final class CharacterInteractor: CharacterInteractorProtocol {
    var presenter: CharacterPresenterProtocol?
    var networkManager: NetworkManagerProtocol?
    var storageManager: StorageManagerProtocol?

    func getCharacters() {
        if let savedCharacters = storageManager?.loadCharacters() {
            presenter?.charactersFetched(savedCharacters)
            return
        }

        networkManager?.getCharacters { [weak self] result in
            switch result {
            case .success(let characters):
                self?.storageManager?.saveCharacters(characters)
                self?.presenter?.charactersFetched(characters)
            case .failure(let error):
                self?.presenter?.charactersFetchFailed(with: error)
            }
        }
    }
}
