//
//  DetailModel.swift
//  Pokedex
//
//  Created by nicolas.e.manograsso on 01/02/2023.
//

import SwiftUI

final class DetailModel: ObservableObject, DetailModelStateProtocol {
    @Published private(set) var pokemon = Pokemon()
    @Published private(set) var contentState: DetailTypes.Model.ContentState = .loading
    
    private(set) var image: Image?
    
    var backgroundColor: Color? {
        pokemon.pokeTypes.first?.backgroundColor
    }
    
    var name: String {
        pokemon.name.uppercased()
    }
    
    private var pokemonInfo: PokemonInfo.StateViewModel {
        PokemonInfo.StateViewModel(number: pokemon.numberFormatted,
                                   name: pokemon.name,
                                   types: pokemon.pokeTypes,
                                   format: .detail)
    }
}

// MARK: - Actions protocol
extension DetailModel: DetailModelActionsProtocol {
    func setupScreen(pokemonData: Pokemon, image: Image?) {
        pokemon = pokemonData
        self.image = image
        
        contentState = .fetched(pokemonInfo)
    }
}

// MARK: - Helper classes
extension DetailTypes.Model {
    enum ContentState {
        case loading
        case fetched(PokemonInfo.StateViewModel)
        case error
    }
}
