//
//  String.swift
//  MercadoLivre
//
//  Created by Cesar on 23/03/21.
//

import Foundation

extension String {
    
    func getCondition() -> String {
        switch self {
        case "new":
            return "Novo"
        case "used":
            return "Usado"
        default:
            return self
        }
    }
    
}
