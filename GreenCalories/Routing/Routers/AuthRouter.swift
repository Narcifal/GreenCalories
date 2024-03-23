//
//  AuthRouter.swift
//  GreenCalories
//
//  Created by Denys Niestierov on 23.03.2024.
//

import UIKit

enum AuthRouterState {
    case welcome
    case login
    case registration
}

// MARK: - AuthRouter -

protocol AuthRouter {
    func route(to state: AuthRouterState)
    func pop(animated: Bool)
    func setRoot(_ navigationController: UINavigationController)
}

final class DefaultAuthRouter: AuthRouter {
    
    // MARK: - Properties -
    
    private let authScreenFactory: AuthScreenFactory
    private var navigationController: UINavigationController!
    
    // MARK: - Init -
    
    init(authScreenFactory: AuthScreenFactory) {
        self.authScreenFactory = authScreenFactory
    }
    
    // MARK: - Internal -
    
    func route(to state: AuthRouterState) {
        switch state {
        case .welcome:
            showWelcomeScreen()
        case .login:
            showLoginScreen()
        case .registration:
            showRegistrationScreen()
        }
    }
    
    func pop(animated: Bool) {
        navigationController.popViewController(animated: animated)
    }
    
    func setRoot(_ navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
}

// MARK: - Private -

private extension DefaultAuthRouter {
    func showWelcomeScreen() {
        navigationController.popToRootViewController(animated: true)
    }
    
    func showLoginScreen() {
        let welcomeScreen = authScreenFactory.makeWelcomeViewController(router: self)
        navigationController.pushViewController(welcomeScreen, animated: true)
    }
    
    func showRegistrationScreen() {
        let welcomeScreen = authScreenFactory.makeWelcomeViewController(router: self)
        navigationController.pushViewController(welcomeScreen, animated: true)
    }
}
