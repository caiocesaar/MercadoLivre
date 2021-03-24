//
//  HomeViewController.swift
//  MercadoLivre
//
//  Created by Caio Cesar on 19/03/21.
//

import UIKit
import RxSwift
import RxCocoa

protocol HomeViewControllerDelegate: class {
    func openDetail(product: Product)
}

final class HomeViewController: BaseViewController {
    
    // MARK: - View
    private unowned var screenView: HomeView { return self.view as! HomeView }
    
    // MARK: - Variables
    private var viewModel: HomeViewModel!
    private var refreshControl = UIRefreshControl()
    private weak var delegate: HomeViewControllerDelegate?
    
    // MARK: - LifeCycle
    override func loadView() {
        view = HomeView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        fetchData()
    }
    
    // MARK: - Init
    convenience init(viewModel: HomeViewModel, delegate: HomeViewControllerDelegate) {
        self.init()
        self.viewModel = viewModel
        self.delegate = delegate
    }
    
    // MARK: - Setup
    private func setup() {
        setupNavbarLogo()
        setupTableView()
        setupObservables()
    }
    
    private func setupTableView() {
        screenView.tableView.delegate = self
        screenView.tableView.dataSource = self
        
        refreshControl.addTarget(self, action: #selector(fetchData), for: .valueChanged)
        screenView.tableView.refreshControl  = refreshControl
        
    }
    
    private func setupObservables() {
        
        viewModel.loading
            .asDriver(onErrorJustReturn: false)
            .drive { [weak self] (loading) in
                loading ? self?.refreshControl.beginRefreshing() : self?.refreshControl.endRefreshing()
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
    @objc private func fetchData() {
        viewModel.fetchData()
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
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let product = viewModel.products.value[indexPath.row]
        delegate?.openDetail(product: product)
    }
    
}
