//
//  BaseViewModel.swift
//  MercadoLivre
//
//  Created by Cesar on 22/03/21.
//

import Combine

class BaseViewModel {
    
    // MARK: - Combine Properties
    let loading = PassthroughSubject<Bool, Never>()
    let error = PassthroughSubject<String, Never>()
    var subscriptions: Set<AnyCancellable> = []
    
}
