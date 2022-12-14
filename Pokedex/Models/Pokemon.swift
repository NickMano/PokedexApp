//
//  Pokemon.swift
//  Pokedex
//
//  Created by nicolas.e.manograsso on 13/12/2022.
//

import Foundation

struct Pokemon: Codable {
    let name: String
    private let sprites: Sprites
    private let types: [PokeTypes]
    let id: Int
    
    var imageUrl: String {
        sprites.other.artwork.imageUrl
    }
    
    var pokeTypes: [PokemonType] {
        types.compactMap { type in
            PokemonType(rawValue: type.type.name)
        }
    }
    
    var numberFormatted: String {
        let number = String(format: "%03d", id)
        return "#\(number)"
    }
}

struct Sprites: Codable {
    let other: OtherSprite
}

struct OtherSprite: Codable {
    let artwork: ArtworkSprite
    
    enum CodingKeys: String, CodingKey {
        case artwork = "official-artwork"
    }
}

struct ArtworkSprite: Codable {
    let imageUrl: String
    
    enum CodingKeys: String, CodingKey {
        case imageUrl = "front_default"
    }
}

struct PokeTypes: Codable {
    let type: PokeType
}

struct PokeType: Codable {
    let name: String
}
