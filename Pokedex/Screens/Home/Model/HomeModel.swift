//
//  HomeModel.swift
//  Pokedex
//
//  Created by nicolas.e.manograsso on 30/01/2023.
//

import SwiftUI

final class HomeModel: ObservableObject, HomeModelStateProtocol {
    @Published var contentState: HomeTypes.Model.ContentState = .loading
}

extension HomeModel: HomeModelActionsProtocol {
    func displayLoading() {
        contentState = .loading
    }
    
    func update(pokemons: [Pokemon]) {
        contentState = .fetched(pokemons)
    }
    
    func displayError() {
        contentState = .error
    }
}

// MARK: - Helper classes
extension HomeTypes.Model {
    enum ContentState {
        case loading
        case fetched([Pokemon])
        case error
    }
}
