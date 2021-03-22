//
//  CustomTableView.swift
//  MercadoLivre
//
//  Created by Cesar on 21/03/21.
//

import UIKit

extension UITableView {
    
    /// Register a Class for cell in view code
    func registerClass<T:UITableViewCell>(from type:T.Type){
        let name = String(describing: T.self)
        register(T.self, forCellReuseIdentifier: name)
    }
    
}
