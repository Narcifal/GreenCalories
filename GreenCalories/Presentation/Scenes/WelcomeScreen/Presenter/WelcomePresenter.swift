//
//  WelcomePresenter.swift
//  GreenCalories
//
//  Created by Denys Niestierov on 23.03.2024.
//

import Foundation

protocol WelcomePresenter {
    func showLoginScreen()
    func showRegistrationScreen()
}

final class DefaultWelcomePresenter: WelcomePresenter {
    
    // MARK: - Properties -
    
    private unowned let view: WelcomeView
    private let router: AuthRouter
    
    // MARK: - Life Cycle -
    
    init(view: WelcomeView, router: AuthRouter) {
        self.view = view
        self.router = router
    }
    
    // MARK: - Internal -
    
    func showLoginScreen() {
        router.route(to: .login)
    }
    
    func showRegistrationScreen() {
        router.route(to: .registration)
    }
}
