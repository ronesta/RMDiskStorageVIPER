//
//  SceneDelegate.swift
//  RMDiskStorageVIPER
//
//  Created by Ибрагим Габибли on 02.02.2025.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene,
               willConnectTo session: UISceneSession,
               options connectionOptions: UIScene.ConnectionOptions) {

        guard let windowScene = (scene as? UIWindowScene) else { return }

        let window  = UIWindow(windowScene: windowScene)

        let initialViewController = CharacterRouter.createModule()

        window.rootViewController = initialViewController
        self.window = window
        window.makeKeyAndVisible()
    }
}
