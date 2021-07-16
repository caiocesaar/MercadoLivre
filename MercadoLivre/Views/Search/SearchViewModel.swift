//
//  SearchViewModel.swift
//  MercadoLivre
//
//  Created by Cesar on 22/03/21.
//

import Foundation
import Combine

final class SearchViewModel: BaseViewModel {
    
    // MARK: - Variables
    let searchText = CurrentValueSubject<String, Never>("")
    
}
