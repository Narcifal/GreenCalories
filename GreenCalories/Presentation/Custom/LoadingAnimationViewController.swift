//
//  LoadingAnimationViewController.swift
//  GreenCalories
//
//  Created by Denys Niestierov on 23.03.2024.
//

import UIKit
import Lottie

protocol LoadingAnimationView: AnyObject {
    func start(completion: EmptyBlock?)
    func hide()
}

final class LoadingAnimationViewController: UIViewController {
    
    // MARK: - UI Components -
    
    private lazy var loadingAnimationView: LottieAnimationView = {
        let animationView = LottieAnimationView(name: AppConstant.initialLoadingAnimationName)
        animationView.contentMode = .scaleAspectFill
        animationView.animationSpeed = 1.5
        animationView.loopMode = .playOnce
        animationView.translatesAutoresizingMaskIntoConstraints = false
        return animationView
    }()
    
    // MARK: - Life Cycle -
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        navigationController?.setNavigationBarHidden(true, animated: false)
    }
}

private extension LoadingAnimationViewController {
    func setupView() {
        view.backgroundColor = .basicBackgroud
        view.addSubview(loadingAnimationView)
        
        NSLayoutConstraint.activate([
            loadingAnimationView.topAnchor.constraint(equalTo: view.topAnchor),
            loadingAnimationView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            loadingAnimationView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            loadingAnimationView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
        ])
    }
    
    func play(completion: EmptyBlock? = nil) {
        loadingAnimationView.play() { [weak self] completed in
            self?.loadingAnimationView.loopMode = .autoReverse
            self?.loadingAnimationView.play()
            completion?()
        }
    }
    
    func remove() {
        view.removeFromSuperview()
    }
}

extension LoadingAnimationViewController: LoadingAnimationView {
    func start(completion: EmptyBlock? = nil) {
        play(completion: completion)
    }
    
    func hide() {
        loadingAnimationView.stop()
        
        UIView.animate(withDuration: 0.3) {
            self.view.alpha = 0
        } completion: { _ in
            self.remove()
        }
    }
}
