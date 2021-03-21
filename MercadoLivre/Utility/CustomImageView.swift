//
//  CustomImageView.swift
//  MercadoLivre
//
//  Created by Cesar on 21/03/21.
//

import UIKit

extension UIImageView {
    func load(url: String?) {
        
        guard let url = url else {
            return
        }
        
        guard let urlImage = URL(string: url) else {
            return
        }
        
        DispatchQueue.global().async { [weak self] in
            if let data = try? Data(contentsOf: urlImage) {
                if let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        self?.image = image
                    }
                }
            }
        }

    }
}
