//
//  AboutIntent.swift
//  Pokedex
//
//  Created by nicolas.e.manograsso on 02/02/2023.
//

final class AboutIntent {
    // MARK: - Model
    private weak var model: AboutModelActionsProtocol?
    
    // MARK: - Service
    private let service: PokemonServiceProtocol
    
    // MARK: - Business Data
    private let pokemon: Pokemon
    
    init(model: AboutModelActionsProtocol, externalData: Pokemon, service: PokemonServiceProtocol) {
        self.model = model
        pokemon = externalData
        self.service = service
    }
}

extension AboutIntent: AboutIntentProtocol {
    func viewOnAppear() {
        model?.setupScreen(pokemon)
        
        fetchSpecies()
    }
}

private extension AboutIntent {
    func fetchSpecies() {
        model?.displaySpeciesLoading()
        
        Task {
            do {
                let species = try await service.fetchSpecies(pokemon.id)
                model?.update(species)
            } catch {
                print("Caca")
            }
        }
    }
}
