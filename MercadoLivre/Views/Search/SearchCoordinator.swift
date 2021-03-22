//
//  SearchCoordinator.swift
//  MercadoLivre
//
//  Created by Cesar on 22/03/21.
//

import UIKit

class SearchCoordinator: Coordinator {
    
    // MARK: - Variables
    private let presenter: UINavigationController
    private var viewController: SearchViewController?
    private var homeCoordinator: HomeCoordinator?
    private var coordinator: Coordinator?
    
    //MARK: - Init
    init(presenter: UINavigationController) {
        self.presenter = presenter
    }
    
    // MARK: - Functions
    func start() {
        let viewController = SearchViewController(delegate: self)
        presenter.pushViewController(viewController, animated: true)
        self.viewController = viewController
    }
    
}

// MARK: - SearchViewControllerDelegate
extension SearchCoordinator: SearchViewControllerDelegate {
    
    func searchTerm(text: String) {
        let homeCoordinator = HomeCoordinator(presenter: presenter, viewModel: HomeViewModel(searchText: text))
        self.homeCoordinator = homeCoordinator
        homeCoordinator.start()
    }
    
}
