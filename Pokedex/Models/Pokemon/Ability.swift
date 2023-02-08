//
//  Ability.swift
//  Pokedex
//
//  Created by nicolas.e.manograsso on 15/12/2022.
//

import Foundation

struct Ability: Codable {
    let ability: NameUrl
    let isHidden: Bool
    let slot: Int
    
    enum CodingKeys: String, CodingKey {
        case ability
        case isHidden = "is_hidden"
        case slot
    }
}
