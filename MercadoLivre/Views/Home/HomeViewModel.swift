//
//  HomeViewModel.swift
//  MercadoLivre
//
//  Created by Cesar on 21/03/21.
//

import Foundation
import Combine

final class HomeViewModel: BaseViewModel {
    
    // MARK: - Properties
    private let searchText: String
    private let productRepository: ProductRepository
    let products = CurrentValueSubject<[Product], Never>([])
    
    // MARK: - Init
    init(productRepository: ProductRepository = ProductRepository(), searchText: String) {
        self.searchText = searchText
        self.productRepository = productRepository
    }
    
    func fetchData() {
        loading.send(true)
        productRepository.getProducts(searchText: searchText)
            .sink { [weak self] (response) in
                switch response {
                case .finished:
                    self?.loading.send(false)
                case .failure(let error):
                    self?.error.send(error.requestMessage)
                    self?.loading.send(false)
                }
            } receiveValue: { [weak self] (response) in
                self?.products.send(response.results)
            }
            .store(in: &subscriptions)
    }
    
}
