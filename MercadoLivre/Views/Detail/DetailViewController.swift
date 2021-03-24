//
//  DetailViewController.swift
//  MercadoLivre
//
//  Created by Cesar on 22/03/21.
//

import UIKit

class DetailViewController: BaseViewController {
    
    // MARK: - View
    private unowned var screenView: DetailView { return self.view as! DetailView }
    private var viewModel: DetailViewModel!

    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    override func loadView() {
        view = DetailView()
    }
    
    // MARK: - Init
    convenience init(viewModel: DetailViewModel) {
        self.init()
        self.viewModel = viewModel
    }
    
    // MARK: - Setup
    private func setup() {
        setupNavbarLogo()
        setupData()
    }
    
    private func setupData() {
        guard let product = viewModel.product.value else { return }
        screenView.setupData(product: product)
    }
    

}
