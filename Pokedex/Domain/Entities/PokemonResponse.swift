//
//  PokemonResponse.swift
//  Pokedex
//
//  Created by nicolas.e.manograsso on 13/12/2022.
//

struct PokemonResponse: Codable {
    let next: String
    let pokemons: [NameUrl]
    
    enum CodingKeys: String, CodingKey {
        case next
        case pokemons = "results"
    }
}

struct NameUrl: Codable {
    let name: String
    let url: String
}
