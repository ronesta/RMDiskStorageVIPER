//
//  CharacterPresenter.swift
//  RMDiskStorageVIPER
//
//  Created by Ибрагим Габибли on 04.02.2025.
//

import Foundation
import UIKit.UIImage

final class CharacterPresenter: CharacterPresenterProtocol {
    weak var view: CharacterViewProtocol?
    var interactor: CharacterInteractorProtocol?
    var router: CharacterRouterProtocol?

    func viewDidLoad() {
        interactor?.getCharacters()
    }

    func charactersFetched(_ characters: [Character]) {
        view?.displayCharacters(characters)
    }

    func charactersFetchFailed(with error: Error) {
        view?.displayError("Failed to load characters: \(error.localizedDescription)")
    }

    func fetchImage(for character: Character, completion: @escaping (UIImage?) -> Void) {
        interactor?.loadImage(for: character, completion: completion)
    }
}
