//
//  ProductRepository.swift
//  MercadoLivre
//
//  Created by Caio Cesar Matos Santos on 15/07/21.
//

import Combine

final class ProductRepository {
    
    func getProducts(searchText: String) -> AnyPublisher<ProductResponse, ErrorResponse> {
        let parameters = ["q": searchText]
        return APIManager.get(endpoint: .search, parameters: parameters)
    }

}
