//
//  CustomImageView.swift
//  MercadoLivre
//
//  Created by Cesar on 21/03/21.
//

import UIKit

extension UIImageView {
    
    /// Set image from a remote url
    ///
    /// - Parameters:
    ///     - url: The url of the image.
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
