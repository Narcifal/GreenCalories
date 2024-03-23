//
//  AppLaunchService.swift
//  GreenCalories
//
//  Created by Denys Niestierov on 23.03.2024.
//

import UIKit

final class AppLaunchService {
    
    // MARK: - Properties -
    
    private var window: UIWindow!
    private let windowScene: UIWindowScene
    private let appConfiguration: AppConfiguration
    private lazy var loadingAnimationView = LoadingAnimationViewController()
    private lazy var authScreenFactory = AuthScreenFactory()
    private lazy var authRouter: AuthRouter = DefaultAuthRouter(authScreenFactory: authScreenFactory)
    
    // MARK: - Init -
    
    init(
        appConfiguration: AppConfiguration,
        windowScene: UIWindowScene
    ) {
        self.appConfiguration = appConfiguration
        self.windowScene = windowScene
    }

    // MARK: - Internal -
    
    func start() {
        appConfiguration.configure()
        
        let welcomeViewController = authScreenFactory.makeWelcomeViewController(router: authRouter)
        authRouter.setRoot(welcomeViewController)
        
        configureWindow(with: welcomeViewController)
    }
}

// MARK: - Private -

private extension AppLaunchService {
    func configureWindow(with viewController: UIViewController) {
        window = UIWindow(windowScene: windowScene)
        window.rootViewController = viewController
        window.makeKeyAndVisible()
    }
}
