//
//  Product.swift
//  MercadoLivre
//
//  Created by Cesar on 21/03/21.
//

import Foundation

class Product: Codable {
    var id: String?
    var site_id: String?
    var title: String?
    var price: Float?
    var condition: String?
    var thumbnail: String?
    var permalink: String?
    var sold_quantity: Int?
    var installments: Installments?
    var available_quantity: Int?
}
