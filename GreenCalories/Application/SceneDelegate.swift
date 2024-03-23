//
//  SceneDelegate.swift
//  GreenCalories
//
//  Created by Denys Niestierov on 23.03.2024.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    
    // MARK: - Properties -
    
    var window: UIWindow?
    private var appLaunchService: AppLaunchService?
    private lazy var appConfiguration: AppConfiguration = DefaultAppConfiguration()

    // MARK: - Internal -
    
    func scene(
        _ scene: UIScene,
        willConnectTo session: UISceneSession,
        options connectionOptions: UIScene.ConnectionOptions
    ) {
        guard let windowScene = (scene as? UIWindowScene) else { return }

        appLaunchService = AppLaunchService(
            appConfiguration: appConfiguration,
            windowScene: windowScene
        )
        appLaunchService?.start()
    }
}

