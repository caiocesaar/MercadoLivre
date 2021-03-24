//
//  Float.swift
//  MercadoLivre
//
//  Created by Cesar on 22/03/21.
//

import Foundation

extension Float {
    
    func toCurrencyFormat() -> String {
        let floatNumber = self/100
        let formatter = NumberFormatter()
        formatter.locale = Locale(identifier: "pt-BR")
        formatter.numberStyle = .currency
        formatter.currencyDecimalSeparator = ","
        formatter.currencyGroupingSeparator = "."
        formatter.maximumFractionDigits = 2
        formatter.minimumFractionDigits = 2
        return formatter.string(from: NSNumber(value: floatNumber)) ?? ""
    }
    
}
