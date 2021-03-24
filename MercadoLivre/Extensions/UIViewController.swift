//
//  CustomViewController.swift
//  MercadoLivre
//
//  Created by Cesar on 19/03/21.
//

import UIKit

extension UIViewController {
    
    /// Set logo in the navigation
    func setupNavbarLogo() {
        let logo = UIImage(named: "logo-h")
        let imageView = UIImageView(image: logo)
        imageView.contentMode = .scaleAspectFit
        navigationItem.titleView = imageView
    }
    
}
