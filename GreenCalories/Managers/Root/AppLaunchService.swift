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
    private var presentingViewController: UIViewController? {
        didSet {
            dispatchGroup.leave()
        }
    }
    private lazy var loadingAnimationView = LoadingAnimationViewController()
    private lazy var dispatchGroup = DispatchGroup()
    
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
