//
//  Int.swift
//  MercadoLivre
//
//  Created by Cesar on 22/03/21.
//

import Foundation

extension Int {
    
    var digits: [Int] {
        return String(describing: self).compactMap { Int(String($0)) }
    }
    
    func toBRLFormat() -> String {
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
