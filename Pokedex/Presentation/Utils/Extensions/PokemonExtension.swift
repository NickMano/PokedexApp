//
//  PokemonExtension.swift
//  Pokedex
//
//  Created by nicolas.e.manograsso on 03/03/2023.
//

import PokedexDomain

extension Pokemon {
    var pokeTypes: [PokemonType] {
        types.compactMap { type in
            PokemonType(rawValue: type.type.name)
        }
    }
}
