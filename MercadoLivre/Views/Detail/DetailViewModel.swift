//
//  DetailViewModel.swift
//  MercadoLivre
//
//  Created by Cesar on 22/03/21.
//

import Combine

final class DetailViewModel: BaseViewModel {
    
    let product: Product!
    
    // MARK: - Init
    init(product: Product) {
        self.product = product
    }
    
}
