//
//  SearchView.swift
//  MercadoLivre
//
//  Created by Cesar on 22/03/21.
//

import UIKit

final class SearchView: BaseView {
    
    // MARK: - Views
    lazy var searchBar = makeSearchBar()
    lazy var searchButton = makeButton()
    
    // MARK: - LifeCycle
    override func addViews() {
        super.addViews()
        addSubview(searchBar)
        addSubview(searchButton)
    }
    
    override func addConstraints() {
        super.addConstraints()
        
        searchBar.snp.makeConstraints { (make) in
            make.leading.top.trailing.equalTo(safeAreaLayoutGuide)
        }
        
        searchButton.snp.makeConstraints { (make) in
            make.height.equalTo(50)
            make.leading.bottom.trailing.equalTo(safeAreaLayoutGuide).inset(16)
        }
        
    }
    
    private func makeSearchBar() -> UISearchBar {
        let searchBar = UISearchBar()
        searchBar.placeholder = "Digite algo..."
        return searchBar
    }
    
    private func makeButton() -> UIButton {
        let button = UIButton()
        button.backgroundColor = .appColor(.colorSecondary)
        button.titleLabel?.textColor = .white
        button.setTitle("Buscar", for: .normal)
        return button
    }
    
}
