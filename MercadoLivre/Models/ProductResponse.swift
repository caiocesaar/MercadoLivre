//
//  ProductResponse.swift
//  MercadoLivre
//
//  Created by Cesar on 23/03/21.
//

import Foundation

class ProductResponse: Codable {
    var id: String?
    var results: [Product]
}
