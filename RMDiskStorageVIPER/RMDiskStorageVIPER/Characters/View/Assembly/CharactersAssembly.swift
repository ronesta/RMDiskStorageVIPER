//
//  CharacterRouter.swift
//  RMDiskStorageVIPER
//
//  Created by Ибрагим Габибли on 04.02.2025.
//

import Foundation
import UIKit.UIViewController

final class CharactersAssembly {
    weak var viewController: UIViewController?

    func createModule() -> UIViewController {
        let storageManager = DiskStorageManager()
        let imageLoader = ImageLoader(storageManager: storageManager)
        let charactersService = CharactersService()

        let dataSource = CharactersTableViewDataSource(imageLoader: imageLoader)
        let router = CharactersAssembly()

        let interactor = CharactersInteractor(
            charactersService: charactersService,
            storageManager: storageManager
        )
        let presenter = CharactersPresenter(interactor: interactor)
        let view = CharactersViewController(presenter: presenter,
                                           dataSource: dataSource
        )

        presenter.view = view
        interactor.presenter = presenter
        router.viewController = view

        let navigationController = UINavigationController(rootViewController: view)
        return navigationController
    }
}
