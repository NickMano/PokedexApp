//
//  AboutModelProtocol.swift
//  Pokedex
//
//  Created by nicolas.e.manograsso on 02/02/2023.
//

import SwiftUI

// MARK: - View State
protocol AboutModelStateProtocol {
    var speciesState: AboutTypes.Model.SpeciesState { get }
    
    var description: String { get }
    var isPokemonLoaded: Bool { get }
    var sectionColor: Color? { get }
    
    var height: (String, String) { get }
    var weight: (String, String) { get }
    var abilities: [Ability] { get }
    
    var baseExperience: String { get }
}

// MARK: - Intent Actions
protocol AboutModelActionsProtocol: AnyObject {
    func setupScreen(_ pokemon: Pokemon)
    func displaySpeciesLoading()
    func update(_ species: PokemonSpecies)
}
