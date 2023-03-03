//
//  HomeIntentProtocol.swift
//  Pokedex
//
//  Created by nicolas.e.manograsso on 31/01/2023.
//

import PokedexDomain

final class HomeIntent {
    // MARK: - Model
    private weak var model: HomeModelActionsProtocol?
    
    // MARK: - UseCases
    private let searchPokemonUseCase: SearchPokemonsUseCase
    
    // MARK: - Business Data
    private var pokemons: [Pokemon] = []
    
    // MARK: - Initializers
    init(model: HomeModelActionsProtocol, searchPokemonUseCase: SearchPokemonsUseCase) {
        self.model = model
        self.searchPokemonUseCase = searchPokemonUseCase
    }
}

extension HomeIntent: HomeIntentProtocol {
    func viewOnAppear() {
        Task {
            model?.displayLoading()
            
            do {
                pokemons = try await searchPokemonUseCase.execute()
                model?.update(pokemons: pokemons)
            } catch {
                model?.displayError()
            }
        }
    }
}
