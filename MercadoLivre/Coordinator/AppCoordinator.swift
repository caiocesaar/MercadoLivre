//
//  AppCoordinator.swift
//  MercadoLivre
//
//  Created by Caio Cesar on 19/03/21.
//

import UIKit

final class AppCoordinator: Coordinator {
    
    // MARK: - Variables
    let window: UIWindow
    let rootViewController: UINavigationController
    let searchCoordinator: SearchCoordinator?
    
    // MARK: - Init
    init(window: UIWindow) {
        self.window = window
        rootViewController = UINavigationController()
        searchCoordinator = SearchCoordinator(presenter: rootViewController)
    }
    
    // MARK: - Functions
    func start() {
        window.rootViewController = rootViewController
        searchCoordinator?.start()
        window.makeKeyAndVisible()
    }
    
}
