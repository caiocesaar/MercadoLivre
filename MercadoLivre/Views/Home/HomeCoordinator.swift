//
//  HomeCoordinator.swift
//  MercadoLivre
//
//  Created by Caio Cesar on 19/03/21.
//

import UIKit

class HomeCoordinator: Coordinator {
    
    // MARK: - Variables
    private let presenter: UINavigationController
    private var viewController: HomeViewController?
    private var coordinator: Coordinator?
    
    //MARK: - Init
    init(presenter: UINavigationController) {
        self.presenter = presenter
    }
    
    // MARK: - Functions
    func start() {
        let viewController = HomeViewController()
        presenter.pushViewController(viewController, animated: true)
        self.viewController = viewController
    }
    
}
