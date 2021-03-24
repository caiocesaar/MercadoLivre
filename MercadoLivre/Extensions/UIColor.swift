//
//  CustomColor.swift
//  MercadoLivre
//
//  Created by Cesar on 19/03/21.
//

import UIKit

enum AssetsColor: String {
    case colorAccent
    case colorSecondary
    case colorSeparator
}

extension UIColor {
    
    /// Returns a given AssetsColor
    static func appColor(_ name: AssetsColor) -> UIColor {
        return UIColor(named: name.rawValue) ?? .black
    }
    
}
