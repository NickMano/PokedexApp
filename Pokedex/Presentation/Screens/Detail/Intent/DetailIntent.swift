//
//  DetailIntent.swift
//  Pokedex
//
//  Created by nicolas.e.manograsso on 01/02/2023.
//

import SwiftUI
import PokedexDomain

final class DetailIntent {
    private weak var model: DetailModelActionsProtocol?
    
    private let externalData: DetailTypes.Intent.ExternalData
    
    init(model: DetailModelActionsProtocol,
         externalData: DetailTypes.Intent.ExternalData) {
        self.model = model
        self.externalData = externalData
    }
}

extension DetailIntent: DetailIntentProtocol {
    func viewOnAppear() {
        model?.setupScreen(pokemonData: externalData.pokemon, image: externalData.image)
    }
}

// MARK: - Helper classes
extension DetailTypes.Intent {
    struct ExternalData {
        let pokemon: Pokemon
        let image: Image?
    }
}
