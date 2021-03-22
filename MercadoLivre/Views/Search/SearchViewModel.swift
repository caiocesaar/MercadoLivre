//
//  SearchViewModel.swift
//  MercadoLivre
//
//  Created by Cesar on 22/03/21.
//

import Foundation
import RxCocoa

class SearchViewModel: BaseViewModel {
    
    // MARK: - Variables
    let searchText = BehaviorRelay<String>(value: "")
    
}
