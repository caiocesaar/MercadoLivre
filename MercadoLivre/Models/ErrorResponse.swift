//
//  ErrorResponse.swift
//  MercadoLivre
//
//  Created by Caio Cesar Matos Santos on 15/07/21.
//

import Foundation

enum ErrorResponse: Error {
    case statusCode
    case message
    case other(Error)
    
    static func map(_ error: Error) -> ErrorResponse {
        return (error as? ErrorResponse) ?? .other(error)
    }
}
