//
//  PokemonSpecies.swift
//  Pokedex
//
//  Created by nicolas.e.manograsso on 15/12/2022.
//

import Foundation

struct PokemonSpecies: Codable {
    let entries: [PokemonEntry]
    let genera: [Genera]
    let growthRate: NameUrl
    let catchRate: Int
    let baseHappiness: Int
    
    enum CodingKeys: String, CodingKey {
        case entries = "flavor_text_entries"
        case genera
        case growthRate = "growth_rate"
        case catchRate = "capture_rate"
        case baseHappiness = "base_happiness"
    }
    
    var speciesName: String {
        guard let species = genera.first(where: { $0.language.name == "en" }) else {
            return ""
        }
        
        return species.genus
    }
    
    var description: String {
        guard let entry = entries.last(where: { $0.language.name == "en" }) else {
            return ""
        }
        
        return entry.description
    }
}

struct Genera: Codable {
    let genus: String
    let language: NameUrl
}

struct PokemonEntry: Codable {
    let description: String
    let language: NameUrl
    let version: NameUrl
    
    enum CodingKeys: String, CodingKey {
        case description = "flavor_text"
        case language
        case version
    }
}
