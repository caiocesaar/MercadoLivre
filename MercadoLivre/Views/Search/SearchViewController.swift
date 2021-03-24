//
//  SearchViewController.swift
//  MercadoLivre
//
//  Created by Cesar on 22/03/21.
//

import UIKit

protocol SearchViewControllerDelegate: class {
    func searchTerm(text: String)
}

final class SearchViewController: BaseViewController {
    
    // MARK: - View
    private unowned var screenView: SearchView { return self.view as! SearchView }
    
    // MARK: - Variables & Constants
    private let viewModel = SearchViewModel()
    private weak var delegate: SearchViewControllerDelegate?

    // MARK: - LifeCycle
    override func loadView() {
        view = SearchView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        screenView.searchBar.becomeFirstResponder()
    }
    
    // MARK: - Init
    convenience init(delegate: SearchViewControllerDelegate) {
        self.init()
        self.delegate = delegate
    }
    
    // MARK: - Setup
    private func setup() {
        setupNavbarLogo()
        setupSearchBar()
        setupButton()
        setupTap()
    }
    
    private func setupSearchBar() {
        screenView.searchBar.delegate = self
    }
    
    private func setupButton() {
        screenView.searchButton.addTarget(self, action: #selector(searchTap), for: .touchUpInside)
    }
    
    private func setupTap() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(closeKeyboard))
        view.addGestureRecognizer(tap)
    }
    
    // MARK: - Actions
    @objc private func closeKeyboard() {
        view.endEditing(true)
    }
    
    @objc private func searchTap() {
        delegate?.searchTerm(text: viewModel.searchText.value)
    }

}

// MARK: - UISearchBarDelegate
extension SearchViewController: UISearchBarDelegate {
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        viewModel.searchText.accept(searchText)
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchTap()
    }
    
}
