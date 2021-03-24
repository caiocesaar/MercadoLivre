//
//  HomeCoordinator.swift
//  MercadoLivre
//
//  Created by Caio Cesar on 19/03/21.
//

import UIKit

final class HomeCoordinator: Coordinator {
    
    // MARK: - Variables
    private let presenter: UINavigationController
    private var viewController: HomeViewController?
    private var coordinator: Coordinator?
    private var detailCoordinator: DetailCoordinator?
    private var viewModel: HomeViewModel
    
    //MARK: - Init
    init(presenter: UINavigationController, viewModel: HomeViewModel) {
        self.presenter = presenter
        self.viewModel = viewModel
    }
    
    // MARK: - Functions
    func start() {
        let viewController = HomeViewController(viewModel: viewModel, delegate: self)
        presenter.pushViewController(viewController, animated: true)
        self.viewController = viewController
    }
    
}

// MARK: - HomeViewControllerDelegate
extension HomeCoordinator: HomeViewControllerDelegate {
    
    func openDetail(product: Product) {
        let detailCoordinator = DetailCoordinator(presenter: presenter, viewModel: DetailViewModel(product: product))
        self.detailCoordinator = detailCoordinator
        detailCoordinator.start()
    }
    
}
