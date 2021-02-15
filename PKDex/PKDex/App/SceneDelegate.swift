//
//  SceneDelegate.swift
//  PKDex
//
//  Created by Patrick Lopes Pedrosa Leal on 12/02/21.
//  Copyright © 2021 Patrick Lopes Pedrosa Leal. All rights reserved.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    /// Navegation controller já configurada.
    private var defaultNavegation: UINavigationController {
        let navigationController = UINavigationController()
        navigationController.navigationBar.tintColor = .black
        navigationController.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.black]
        return navigationController
    }

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        let navagation = defaultNavegation
        let coordinator = HomeCoordinator(navigationController: navagation)
        window = UIWindow(windowScene: windowScene)
        window?.rootViewController = navagation
        window?.makeKeyAndVisible()
        coordinator.start()
    }
}

