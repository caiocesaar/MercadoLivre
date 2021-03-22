//
//  BaseViewModel.swift
//  MercadoLivre
//
//  Created by Cesar on 22/03/21.
//

import RxSwift

class BaseViewModel {
    
    // MARK: - Rx Disposable
    let disposeBag = DisposeBag()
    
    // MARK: - Variables
    let loading = PublishSubject<Bool>()
    let error = PublishSubject<String>()
    
}
