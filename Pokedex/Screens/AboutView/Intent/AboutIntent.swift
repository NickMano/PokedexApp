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
        fetchTypes()
    }
}

private extension AboutIntent {
    func fetchSpecies() {
        model?.displaySpeciesLoading()
        
        Task {
            do {
                let pokemonId = pokemon.id
                let species = try await service.fetchSpecies(pokemonId)
                model?.update(species)
                
                let typeNames = pokemon.types.map { $0.type.name }
            } catch {
                print("Caca")
            }
        }
    }
    
    func fetchTypes() {
        Task {
            do {
                let typeNames = pokemon.types.map { $0.type.name }
                
                try await withThrowingTaskGroup(of: TypeResponse.self) { group in
                    for name in typeNames {
                        group.addTask {
                            let response = try await self.service.fetchTypes(name)
                            return response
                        }
                    }
                    
                    var types: [TypeResponse] = []
                    
                    for try await typeOfPokemon in group {
                        types.append(typeOfPokemon)
                    }
                    
                    model?.update(types)
                }
            } catch {
                print("Caca")
            }
        }
    }
}
