//
//  HomeViewModel.swift
//  MercadoLivre
//
//  Created by Cesar on 21/03/21.
//

import Foundation
import RxSwift
import RxCocoa

class HomeViewModel: BaseViewModel {
    
    // MARK: - Variables
    private let searchText = BehaviorRelay<String>(value: "")
    
    // MARK: - Init
    init(searchText: String) {
        self.searchText.accept(searchText)
    }
    
    // MARK: - Constants
    let products = BehaviorRelay<[Product]>(value: [])
    
    func fetchData() {
        loading.onNext(true)
        APIService.getProducts(searchText: searchText.value).subscribe { [weak self] (response) in
            self?.products.accept(response.results)
            self?.loading.onNext(false)
        } onError: { [weak self] (error) in
            self?.error.onNext(error.requestMessage)
            self?.loading.onNext(false)
        }.disposed(by: disposeBag)
    }
    
}
