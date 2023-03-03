//
//  EggGroup.swift
//  Pokedex
//
//  Created by nicolas.e.manograsso on 20/02/2023.
//

struct EggGroup: Codable {
    let names: [Name]
}

struct Name: Codable {
    let name: String
    let language: NameUrl
}
