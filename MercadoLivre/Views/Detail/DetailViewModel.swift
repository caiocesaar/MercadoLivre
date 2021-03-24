//
//  DetailViewModel.swift
//  MercadoLivre
//
//  Created by Cesar on 22/03/21.
//

import RxCocoa

class DetailViewModel: BaseViewModel {
    
    let product = BehaviorRelay<Product?>(value: nil)
    
    // MARK: - Init
    init(product: Product) {
        self.product.accept(product)
    }
    
}
