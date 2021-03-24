//
//  APIService.swift
//  MercadoLivre
//
//  Created by Cesar on 21/03/21.
//

import RxSwift
import Alamofire

final class APIService {
    
    /// Get a array of the products from a SearchTerm
    ///
    /// - Parameters:
    ///     - searchText: Term for search products
    static func getProducts(searchText: String) -> Observable<ProductResponse> {
        var parameters = Parameters()
        parameters["q"] = searchText
        return RequestManager.getToAPIService(endpoint: .search, parameters: parameters)
    }
    
}
