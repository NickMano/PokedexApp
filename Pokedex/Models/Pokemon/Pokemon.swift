//
//  Pokemon.swift
//  Pokedex
//
//  Created by nicolas.e.manograsso on 13/12/2022.
//

import Foundation

struct Pokemon: Codable {
    private let sprites: Sprites
    private let types: [PokeTypes]
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
        self.sprites = Sprites(other: OtherSprite(artwork: ArtworkSprite(imageUrl: "")))
        self.types = []
        self.species = NameUrl(name: "", url: "")
        self.name = ""
        self.id = 0
        self.height = 0
        self.weight = 0
        self.abilities = []
        self.baseExperience = 0
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
    let type: PokeType
}

struct PokeType: Codable {
    let name: String
}
