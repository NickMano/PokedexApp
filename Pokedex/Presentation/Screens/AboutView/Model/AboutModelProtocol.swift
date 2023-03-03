//
//  AboutModelProtocol.swift
//  Pokedex
//
//  Created by nicolas.e.manograsso on 02/02/2023.
//

import SwiftUI
import PokedexDomain

// MARK: - View State
protocol AboutModelStateProtocol {
    var speciesState: AboutTypes.Model.State { get }
    var eggGroupsState: AboutTypes.Model.State { get }
    
    var description: String { get }
    var isPokemonLoaded: Bool { get }
    var sectionColor: Color? { get }
    
    var pokedexData: PokedexDataModel { get }
    var trainingData: TrainingModel { get }
    var breedingData: BreedingModel { get }
}

// MARK: - Intent Actions
protocol AboutModelActionsProtocol: AnyObject {
    func setupScreen(_ pokemon: Pokemon)
    
    func displaySpeciesLoading()
    func displayEggGroupsLoading()
    
    func update(_ species: PokemonSpecies)
    func update(_ damageRelations: TypeRelation)
    func update(_ eggGroups: [EggGroup])
}

struct PokedexDataModel {
    var species: String = ""
    var height: (String, String) = ("", "")
    var weight: (String, String) = ("", "")
    var abilities: [Ability] = []
    var weaknesses: [PokemonType] = []
}

struct TrainingModel {
    var evYield: [String] = []
    var catchRate: String = ""
    var baseFriendship: String = ""
    var baseExp: String = ""
    var growthRate: String = ""
}

struct BreedingModel {
    var gender: Int = 0
    var eggGroups: String = ""
    var eggCycles: String = ""
}
