//
//  HomeIntentProtocol.swift
//  Pokedex
//
//  Created by nicolas.e.manograsso on 31/01/2023.
//

final class HomeIntent {
    // MARK: - Model
    private weak var model: HomeModelActionsProtocol?
    
    // MARK: - Service
    private let service: PokemonServiceProtocol
    
    // MARK: - Business Data
    private var pokemons: [Pokemon] = []
    
    // MARK: - Initializers
    init(model: HomeModelActionsProtocol, service: PokemonServiceProtocol = PokemonService()) {
        self.model = model
        self.service = service
    }
}

extension HomeIntent: HomeIntentProtocol {
    func viewOnAppear() {
        Task {
            model?.displayLoading()
            
            do {
                pokemons = try await service.fetchPokemons()
                model?.update(pokemons: pokemons)
            } catch {
                model?.displayError()
            }
        }
    }
}
