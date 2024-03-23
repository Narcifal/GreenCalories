//
//  AppConfiguration.swift
//  GreenCalories
//
//  Created by Denys Niestierov on 23.03.2024.
//

import Foundation

protocol AppConfiguration {
    func configure()
}

final class DefaultAppConfiguration: AppConfiguration {
    func configure() {
        registerServices()
    }
}

// MARK: - Private -

private extension DefaultAppConfiguration {
    func registerServices() { }
}
