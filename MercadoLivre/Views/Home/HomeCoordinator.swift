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
    private var viewModel: HomeViewModel
    
    //MARK: - Init
    init(presenter: UINavigationController, viewModel: HomeViewModel) {
        self.presenter = presenter
        self.viewModel = viewModel
    }
    
    // MARK: - Functions
    func start() {
        let viewController = HomeViewController(viewModel: viewModel)
        presenter.pushViewController(viewController, animated: true)
        self.viewController = viewController
    }
    
}
