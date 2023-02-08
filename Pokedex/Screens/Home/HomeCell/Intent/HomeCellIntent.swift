//
//  HomeCellIntent.swift
//  Pokedex
//
//  Created by nicolas.e.manograsso on 31/01/2023.
//

import SwiftUI

final class HomeCellIntent {
    // MARK: Model
    private weak var model: HomeCellModelActionsProtocol?
    private weak var routeModel: HomeCellModelRouterProtocol?

    // MARK: Services
    private let service: PokemonServiceProtocol

    // MARK: Business Data
    private var pokemon: Pokemon
    private var image = Image("")

    // MARK: Life cycle
    init(model: HomeCellModelActionsProtocol & HomeCellModelRouterProtocol,
         pokemon: Pokemon,
         service: PokemonServiceProtocol) {
        self.model = model
        routeModel = model
        self.pokemon = pokemon
        self.service = service
    }
}

extension HomeCellIntent: HomeCellIntentProtocol {
    func viewOnAppear() {
        Task {
            model?.displayLoading()
            
            do {
                image = try await service.fetchPokemonImage(pokemon.imageUrl)
                model?.update(image)
            } catch {
                model?.displayError()
            }
        }
    }
    
    func onTapCell() {
        routeModel?.goToDetail(pokemon: pokemon, image: image)
    }
}
