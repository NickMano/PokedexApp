//
//  Pokemon.swift
//  Pokedex
//
//  Created by nicolas.e.manograsso on 13/12/2022.
//

import Foundation

struct Pokemon: Codable {
    private let sprites: Sprites
    let types: [PokeTypes]
    let species: NameUrl
    
    let name: String
    let id: Int
    let height: Int
    let weight: Int
    let abilities: [Ability]
    let baseExperience: Int?
    
    enum CodingKeys: String, CodingKey {
        case sprites
        case types
        case species
        case name
        case id
        case height
        case weight
        case abilities
        case baseExperience = "base_experience"
    }
    
    init() {
        sprites = Sprites(other: OtherSprite(artwork: ArtworkSprite(imageUrl: "")))
        types = []
        species = NameUrl(name: "", url: "")
        name = ""
        id = 0
        height = 0
        weight = 0
        abilities = []
        baseExperience = 0
    }
    
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
    
    var speciesUrl: String {
        species.url
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
    let type: NameUrl
}

struct PokeType: Codable {
    let name: String
}
