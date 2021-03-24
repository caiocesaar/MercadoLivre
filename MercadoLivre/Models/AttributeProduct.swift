//
//  AttributeProduct.swift
//  MercadoLivre
//
//  Created by Cesar on 23/03/21.
//

import Foundation

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
