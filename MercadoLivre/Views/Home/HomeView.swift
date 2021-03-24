//
//  HomeView.swift
//  MercadoLivre
//
//  Created by Cesar on 19/03/21.
//

import UIKit

final class HomeView: BaseView {
    
    // MARK: - Views
    lazy var tableView = makeTableView()
    
    // MARK: - LifeCycle
    override func addViews() {
        super.addViews()
        addSubview(tableView)
    }
    
    override func addConstraints() {
        super.addConstraints()
        
        tableView.snp.makeConstraints { (make) in
            make.edges.equalTo(safeAreaLayoutGuide)
        }
        
    }
    
    // MARK: - Function View's
    private func makeTableView() -> UITableView {
        let tableView = UITableView()
        tableView.allowsSelection = true
        tableView.isUserInteractionEnabled = true
        tableView.registerClass(from: HomeViewCell.self)
        return tableView
    }
    
}
