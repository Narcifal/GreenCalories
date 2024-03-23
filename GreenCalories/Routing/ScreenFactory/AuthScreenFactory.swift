//
//  AuthScreenFactory.swift
//  GreenCalories
//
//  Created by Denys Niestierov on 23.03.2024.
//

import UIKit

final class AuthScreenFactory {
    
    // MARK: - Internal -
    
    func makeWelcomeViewController(router: AuthRouter) -> UINavigationController {
        let welcomeViewController = WelcomeViewController()
        let presenter = DefaultWelcomePresenter(
            view: welcomeViewController,
            router: router
        )
        welcomeViewController.presenter = presenter
        return UINavigationController(rootViewController: welcomeViewController)
    }
}
