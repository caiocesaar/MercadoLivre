//
//  HomeViewModel.swift
//  MercadoLivre
//
//  Created by Cesar on 21/03/21.
//

import Foundation
import RxSwift
import RxCocoa

class HomeViewModel {
    
    // MARK: - Constants
    private let disposeBag = DisposeBag()
    let products = BehaviorRelay<[Product]>(value: [])
    let loading = PublishSubject<Bool>()
    let error = PublishSubject<String>()
    
    func fetchData(searchText: String) {
        loading.onNext(false)
        APIService.getProducts(searchText: searchText).subscribe { [weak self] (response) in
            self?.products.accept(response.results)
            self?.loading.onNext(false)
        } onError: { [weak self] (error) in
            self?.error.onNext(error.requestMessage)
            self?.loading.onNext(false)
        }.disposed(by: disposeBag)

    }
    
    
}
