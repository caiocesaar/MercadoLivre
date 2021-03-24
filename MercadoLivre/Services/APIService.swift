//
//  APIService.swift
//  MercadoLivre
//
//  Created by Cesar on 21/03/21.
//

import RxSwift
import Alamofire

final class APIService {
    
    static func getProducts(searchText: String) -> Observable<ProductResponse> {
        var parameters = Parameters()
        parameters["q"] = searchText
        return RequestManager.getToAPIService(endpoint: .search, parameters: parameters)
    }
    
}
