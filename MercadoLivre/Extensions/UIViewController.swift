//
//  CustomViewController.swift
//  MercadoLivre
//
//  Created by Cesar on 19/03/21.
//

import UIKit

private var loaderView: UIView?

extension UIViewController {
    
    func setupNavbarLogo() {
        let logo = UIImage(named: "logo-h")
        let imageView = UIImageView(image: logo)
        imageView.contentMode = .scaleAspectFit
        navigationItem.titleView = imageView
    }
    
    func showLoader() {
        if(loaderView == nil) {
            
            
            loaderView = UIView(frame: UIScreen.main.bounds)
        
            let blurEffect = UIBlurEffect(style: UIBlurEffect.Style.dark)
            let viewBlur = UIVisualEffectView(effect: blurEffect)
            
            viewBlur.layer.cornerRadius = 10
            viewBlur.clipsToBounds = true

            viewBlur.frame = CGRect(x: 0, y: 0, width: 120, height: 100)
            loaderView?.addSubview(viewBlur)
            viewBlur.center = loaderView!.center
            let stackView = UIStackView(frame: viewBlur.frame)
            stackView.spacing = 16
            stackView.axis = .vertical
            
            // loader
            let loader = UIActivityIndicatorView(style: .whiteLarge)
            loader.frame = CGRect(x: 0.0, y: 0.0, width: 50.0, height: 50.0)
            loader.startAnimating()
            loader.color = .white
            stackView.addArrangedSubview(loader)
            
            // add stackview as subview for centerView
            viewBlur.contentView.addSubview(stackView)
            
            // setup constraints
            stackView.translatesAutoresizingMaskIntoConstraints = false
            viewBlur.addConstraints([
                NSLayoutConstraint(item: stackView, attribute: .centerX, relatedBy: .equal, toItem: viewBlur, attribute: .centerX, multiplier: 1, constant: 0),
                NSLayoutConstraint(item: stackView, attribute: .centerY, relatedBy: .equal, toItem: viewBlur, attribute: .centerY, multiplier: 1, constant: 0),
                NSLayoutConstraint(item: stackView, attribute: .leading, relatedBy: .equal, toItem: viewBlur, attribute: .leading, multiplier: 1, constant: 0),
                NSLayoutConstraint(item: stackView, attribute: .trailing, relatedBy: .equal, toItem: viewBlur, attribute: .trailing, multiplier: 1, constant: 0)
            ])
        }
        
        guard let loaderView = loaderView else { return }
        if navigationController ==  nil {
            view.addSubview(loaderView)
        } else {
            navigationController?.view.addSubview(loaderView)
        }
    }
    
    func hideLoader () {
        if(loaderView != nil){
            loaderView?.removeFromSuperview()
        }
    }
    
    func setLoader(show: Bool) {
        show ? showLoader() : hideLoader()
    }
    
}
