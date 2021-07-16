//
//  String.swift
//  MercadoLivre
//
//  Created by Caio Cesar Matos Santos on 15/07/21.
//

import Foundation

extension String {
    
    func stringByAddingPercentEncodingForURLQueryValue() -> String? {
        let allowedCharacters = CharacterSet(charactersIn: "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789-._~")
        return addingPercentEncoding(withAllowedCharacters: allowedCharacters)
    }
    
}
