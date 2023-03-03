//
//  Type.swift
//  Pokedex
//
//  Created by nicolas.e.manograsso on 09/02/2023.
//

struct TypeResponse: Codable {
    let damageRelations: TypeRelation
    
    enum CodingKeys: String, CodingKey {
        case damageRelations = "damage_relations"
    }
}

struct TypeRelation: Codable {
    let doubleDamageFrom: [NameUrl]
    let noDamageFrom: [NameUrl]
    let halfDamageFrom: [NameUrl]
    
    enum CodingKeys: String, CodingKey {
        case doubleDamageFrom = "double_damage_from"
        case noDamageFrom = "no_damage_from"
        case halfDamageFrom = "half_damage_from"
    }
}
