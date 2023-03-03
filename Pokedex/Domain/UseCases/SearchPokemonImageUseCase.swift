//
//  SearchPokemonImageUseCase.swift
//  Pokedex
//
//  Created by nicolas.e.manograsso on 02/03/2023.
//

import Foundation

protocol SearchPokemonImageUseCase {
    func execute(urlImage: String) async throws -> Data
}

final class DefaultSearchPokemonImageUseCase: SearchPokemonImageUseCase {
    private let pokemonRepository: PokemonRepository
    
    init(pokemonRepository: PokemonRepository) {
        self.pokemonRepository = pokemonRepository
    }
    
    func execute(urlImage: String) async throws -> Data {
        return try await pokemonRepository.fetchPokemonImage(urlImage)
    }
}
