//
//  SearchPokemonsUseCase.swift
//  Pokedex
//
//  Created by nicolas.e.manograsso on 02/03/2023.
//

protocol SearchPokemonsUseCase {
    func execute() async throws -> [Pokemon]
}

final class DefaultSearchPokemonsUseCase: SearchPokemonsUseCase {
    private let pokemonRepository: PokemonRepository
    
    init(pokemonRepository: PokemonRepository) {
        self.pokemonRepository = pokemonRepository
    }
    
    func execute() async throws -> [Pokemon] {
        return try await pokemonRepository.fetchPokemons()
    }
}
