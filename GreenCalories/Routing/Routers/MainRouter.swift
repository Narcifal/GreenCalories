//
//  MainRouter.swift
//  GreenCalories
//
//  Created by Denys Niestierov on 23.03.2024.
//

import UIKit

enum MainRouterState { }

// MARK: - MainRouter -

protocol MainRouter {
    func route(to state: MainRouterState)
    func pop(animated: Bool)
    func setRoot(_ navigationController: UINavigationController)
}

final class DefaultMainRouter: MainRouter {
    
    // MARK: - Properties -
    
    private let mainScreenFactory: MainScreenFactory
    private var navigationController: UINavigationController!
    
    // MARK: - Init -
    
    init(mainScreenFactory: MainScreenFactory) {
        self.mainScreenFactory = mainScreenFactory
    }
    
    // MARK: - Internal -
    
    func route(to state: MainRouterState) {
        switch state {
        default:
            break
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

private extension DefaultMainRouter { }
