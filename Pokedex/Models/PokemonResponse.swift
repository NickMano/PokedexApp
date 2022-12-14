//
//  PokemonResponse.swift
//  Pokedex
//
//  Created by nicolas.e.manograsso on 13/12/2022.
//

struct PokemonResponse: Codable {
    let next: String
    let pokemons: [PokemonInfo]
    
    enum CodingKeys: String, CodingKey {
        case next
        case pokemons = "results"
    }
}

struct PokemonInfo: Codable {
    let name: String
    let url: String
}
