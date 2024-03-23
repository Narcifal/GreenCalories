//
//  WelcomeViewController.swift
//  GreenCalories
//
//  Created by Denys Niestierov on 23.03.2024.
//

import UIKit

protocol WelcomeView: AnyObject { }

final class WelcomeViewController: UIViewController {

    // MARK: - Properties -
    
    var presenter: WelcomePresenter!
    
    // MARK: - Life Cycle -
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .basicBackgroud
    }
}

// MARK: - WelcomeView -

extension WelcomeViewController: WelcomeView { }
