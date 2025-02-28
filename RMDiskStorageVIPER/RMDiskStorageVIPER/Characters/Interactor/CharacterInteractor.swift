//
//  CharacterInteractor.swift
//  RMDiskStorageVIPER
//
//  Created by Ибрагим Габибли on 04.02.2025.
//

import Foundation
import UIKit.UIImage

final class CharacterInteractor: CharacterInteractorProtocol {
    private let presenter: CharacterPresenterProtocol
    private let networkManager: NetworkManagerProtocol
    private let storageManager: StorageManagerProtocol

    init(presenter: CharacterPresenterProtocol,
         networkManager: NetworkManagerProtocol,
         storageManager: StorageManagerProtocol
    ) {
        self.presenter = presenter
        self.networkManager = networkManager
        self.storageManager = storageManager
    }

    func getCharacters() {
        if let savedCharacters = storageManager.loadCharacters() {
            presenter.charactersFetched(savedCharacters)
            return
        }

        networkManager.getCharacters { [weak self] result in
            switch result {
            case .success(let characters):
                self?.storageManager.saveCharacters(characters)
                self?.presenter.charactersFetched(characters)
            case .failure(let error):
                self?.presenter.charactersFetchFailed(with: error)
            }
        }
    }

    func loadImage(for character: Character, completion: @escaping (UIImage?) -> Void) {
        networkManager.loadImage(from: character.image, completion: completion)
    }
}
