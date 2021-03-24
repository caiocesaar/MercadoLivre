//
//  DetailCoordinator.swift
//  MercadoLivre
//
//  Created by Cesar on 22/03/21.
//

import UIKit

final class DetailCoordinator: Coordinator {
    
    // MARK: - Variables
    private let presenter: UINavigationController
    private var viewController: DetailViewController?
    private var coordinator: Coordinator?
    private var viewModel: DetailViewModel
    
    //MARK: - Init
    init(presenter: UINavigationController, viewModel: DetailViewModel) {
        self.presenter = presenter
        self.viewModel = viewModel
    }
    
    // MARK: - Functions
    func start() {
        let viewController = DetailViewController(viewModel: viewModel)
        presenter.pushViewController(viewController, animated: true)
        self.viewController = viewController
    }
    
}
