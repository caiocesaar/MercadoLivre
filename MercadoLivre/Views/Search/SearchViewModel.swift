//
//  SearchViewModel.swift
//  MercadoLivre
//
//  Created by Cesar on 22/03/21.
//

import Foundation
import RxCocoa

final class SearchViewModel: BaseViewModel {
    
    // MARK: - Variables
    let searchText = BehaviorRelay<String>(value: "")
    
}
