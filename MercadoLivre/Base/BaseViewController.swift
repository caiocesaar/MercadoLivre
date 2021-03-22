//
//  BaseViewController.swift
//  MercadoLivre
//
//  Created by Cesar on 22/03/21.
//

import UIKit
import RxSwift

class BaseViewController: UIViewController {
    
    // MARK: - Variables
    let disposeBag = DisposeBag()
    
    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTap()
        setupBack()
    }
    
    // MARK: - Setup
    private func setupTap() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(closeKeyboard))
        view.addGestureRecognizer(tap)
    }
    
    func setupBack() {
        let backItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        navigationItem.backBarButtonItem = backItem
    }
    
    // MARK: - Action
    @objc private func closeKeyboard() {
        view.endEditing(true)
    }
    
}
