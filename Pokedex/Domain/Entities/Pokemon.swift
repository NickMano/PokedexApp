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
    let identifier: Int
    let height: Int
    let weight: Int
    let abilities: [Ability]
    let baseExperience: Int?
    let stats: [Stat]
    
    enum CodingKeys: String, CodingKey {
        case sprites
        case types
        case species
        case name
        case identifier = "id"
        case height
        case weight
        case abilities
        case stats
        case baseExperience = "base_experience"
    }
    
    init() {
        sprites = Sprites(other: OtherSprite(artwork: ArtworkSprite(imageUrl: "")))
        types = []
        species = NameUrl(name: "", url: "")
        name = ""
        identifier = 0
        height = 0
        weight = 0
        abilities = []
        baseExperience = 0
        stats = []
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
        let number = String(format: "%03d", identifier)
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

struct Stat: Codable {
    let baseStat: Int
    let effort: Int
    let stat: NameUrl
    
    enum CodingKeys: String, CodingKey {
        case baseStat = "base_stat"
        case effort
        case stat
    }
}
