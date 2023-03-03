//
//  PokemonRepository.swift
//  Pokedex
//
//  Created by nicolas.e.manograsso on 02/03/2023.
//

import Foundation

protocol PokemonRepository {
    func fetchPokemons() async throws -> [Pokemon]
    func fetchPokemonImage(_ imageUrl: String) async throws -> Data
    func fetchSpecies(_ identifier: Int) async throws -> PokemonSpecies
    func fetchTypes(_ name: String) async throws -> TypeResponse
    func fetchEggGroup(_ name: String) async throws -> EggGroup
}
