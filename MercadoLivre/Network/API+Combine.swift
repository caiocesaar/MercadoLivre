//
//  RequestManagerCombine.swift
//  MercadoLivre
//
//  Created by Caio Cesar Matos Santos on 15/07/21.
//

import Combine
import Foundation

enum APIMethod: String {
    case get = "GET"
    case post = "POST"
    case put = "PUT"
    case delete = "DELETE"
}

final class APIManager<T:Codable> {
    
    // MARK: - Http Methods
    static func get(endpoint: Endpoint, parameters: Dictionary<String, String>? = nil) -> AnyPublisher<T, ErrorResponse> {
        return createPublisher(method: .get, endpoint: endpoint, parameters: parameters)
    }
    
    static func post(endpoint: Endpoint, parameters: Dictionary<String, String>?) -> AnyPublisher<T, ErrorResponse> {
        return createPublisher(method: .post, endpoint: endpoint, parameters: parameters)
    }
    
    static func put(endpoint: Endpoint, parameters: Dictionary<String, String>?) -> AnyPublisher<T, ErrorResponse> {
        return createPublisher(method: .put, endpoint: endpoint, parameters: parameters)
    }
    
    static func delete(endpoint: Endpoint, parameters: Dictionary<String, String>?) -> AnyPublisher<T, ErrorResponse> {
        return createPublisher(method: .delete, endpoint: endpoint, parameters: parameters)
    }
    
    // MARK: - Private Properties
    /// The default headers for the URLRequest
    private class var headers: [String : String] {
        return ["Content-type": "application/json"]
    }
    
    // MARK: - Private Methods
    /// Create publisher combine
    private static func createPublisher(
        method: APIMethod,
        endpoint: Endpoint,
        parameters: Dictionary<String,String>? = nil
    ) -> AnyPublisher<T,ErrorResponse> {
                
        var urlStr = "\(apiUrl)\(endpoint.rawValue)"
        
        if method == .get {
            let parameterString = parameters?.stringFromHttpParameters()
            urlStr = "\(urlStr)?\(parameterString ?? "")"
        }
        
        let url = URL(string: urlStr)!
        var request = URLRequest(url: url)
        request.allHTTPHeaderFields = headers
        request.httpMethod = method.rawValue
        
        let session = getConfigSession()
        
        return session.dataTaskPublisher(for: request)
            .tryMap { (response) -> Data in
                guard
                  let httpURLResponse = response.response as? HTTPURLResponse,
                  httpURLResponse.statusCode == 200
                  else {
                    throw ErrorResponse.statusCode
                }
                return response.data
            }
            .decode(type: T.self, decoder: JSONDecoder())
            .mapError { ErrorResponse.map($0) }
            .eraseToAnyPublisher()
        
    }
    
    /// Get config session for make requests
    private static func getConfigSession() -> URLSession {
        let config = URLSessionConfiguration.default
        config.requestCachePolicy = .reloadIgnoringLocalCacheData
        config.urlCache = nil
        return URLSession(configuration: config)
    }
    
}
