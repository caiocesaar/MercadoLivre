//
//  Product.swift
//  MercadoLivre
//
//  Created by Cesar on 21/03/21.
//

import Foundation

class MainProductResponse: Codable {
    var id: String?
    var results: [Product]
}

class Product: Codable {
    var id: String?
    var site_id: String?
    var title: String?
    var price: Int?
    var condition: String?
    var thumbnail: String?
    var permalink: String?
}

class AttributeProduct: Codable {
    var value_name: String?
    var value_struct: String?
    var attribute_group_id: String?
    var attribute_group_name: String?
    var id: String?
    var value_id: String?
    var values: [ValueAttribute]?
    var source: Int?
    var name: String?
}

class ValueAttribute: Codable {
    var id: String?
    var name: String?
}
