//
//  HomeViewController.swift
//  MercadoLivre
//
//  Created by Caio Cesar on 19/03/21.
//

import UIKit
import RxSwift
import RxCocoa

class HomeViewController: UIViewController {
    
    // MARK: - View
    private unowned var screenView: HomeView { return self.view as! HomeView }
    
    // MARK: - Variables
    private let viewModel = HomeViewModel()
    private let disposeBag = DisposeBag()

    // MARK: - LifeCycle
    override func loadView() {
        view = HomeView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        fetchData()
    }
    
    // MARK: - Setup
    private func setup() {
        setupNavbar()
        setupTableView()
        setupObservables()
    }
    
    private func setupTableView() {
        screenView.tableView.delegate = self
        screenView.tableView.dataSource = self
    }
    
    private func setupObservables() {
        
        viewModel.loading
            .asDriver(onErrorJustReturn: false)
            .drive { [weak self] (loading) in
                self?.setLoader(show: loading)
            }
            .disposed(by: disposeBag)
        
        viewModel.products
            .asObservable()
            .subscribe { [weak self] (_) in
                self?.screenView.tableView.reloadData()
            }
            .disposed(by: disposeBag)
        
    }
    
    // MARK: - Data
    private func fetchData() {
        viewModel.fetchData(searchText: "TV 40 polegadas")
    }

}

// MARK: - UITableViewDelegate, UITableViewDataSource
extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.products.value.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: HomeViewCell.identifier, for: indexPath) as! HomeViewCell
        cell.setup(product: viewModel.products.value[indexPath.row])
        return cell
    }

}
