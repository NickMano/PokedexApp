//
//  PokemonType.swift
//  Pokedex
//
//  Created by nicolas.e.manograsso on 24/10/2022.
//

import UIKit
import SwiftUI

enum PokemonType: String, CaseIterable {
    case bug
    case dark
    case dragon
    case electric
    case fairy
    case fighting
    case fire
    case flying
    case ghost
    case grass
    case ground
    case ice
    case normal
    case poison
    case psychic
    case rock
    case steel
    case water
    
    var iconImage: Image {
        switch self {
        case .bug: return Image.bug.renderingMode(.template)
        case .dark: return Image.dark.renderingMode(.template)
        case .dragon: return Image.dragon.renderingMode(.template)
        case .electric: return Image.electric.renderingMode(.template)
        case .fairy: return Image.fairy.renderingMode(.template)
        case .fighting: return Image.fighting.renderingMode(.template)
        case .fire: return Image.fire.renderingMode(.template)
        case .flying: return Image.flying.renderingMode(.template)
        case .ghost: return Image.ghost.renderingMode(.template)
        case .grass: return Image.grass.renderingMode(.template)
        case .ground: return Image.ground.renderingMode(.template)
        case .ice: return Image.ice.renderingMode(.template)
        case .normal: return Image.normal.renderingMode(.template)
        case .poison: return Image.poison.renderingMode(.template)
        case .psychic: return Image.psychic.renderingMode(.template)
        case .rock: return Image.rock.renderingMode(.template)
        case .steel: return Image.steel.renderingMode(.template)
        case .water: return Image.water.renderingMode(.template)
        }
    }
    
    var name: String {
        switch self {
        case .bug: return "Bug"
        case .dark: return "Dark"
        case .dragon: return "Dragon"
        case .electric: return "Electric"
        case .fairy: return "Fairy"
        case .fighting: return "Fighting"
        case .fire: return "Fire"
        case .flying: return "Flying"
        case .ghost: return "Ghost"
        case .grass: return "Grass"
        case .ground: return "Ground"
        case .ice: return "Ice"
        case .normal: return "Normal"
        case .poison: return "Poison"
        case .psychic: return "Psychic"
        case .rock: return "Rock"
        case .steel: return "Steel"
        case .water: return "Water"
        }
    }
    
    var iconColor: Color {
        switch self {
        case .bug: return .bugType
        case .dark: return .darkType
        case .dragon: return .dragonType
        case .electric: return .electricType
        case .fairy: return .fairyType
        case .fighting: return .fightingType
        case .fire: return .fireType
        case .flying: return .flyingType
        case .ghost: return .ghostType
        case .grass: return .grassType
        case .ground: return .groundType
        case .ice: return .iceType
        case .normal: return .normalType
        case .poison: return .poisonType
        case .psychic: return .psychicType
        case .rock: return .rockType
        case .steel: return .steelType
        case .water: return .waterType
        }
    }
    
    var backgroundColor: Color {
        switch self {
        case .bug: return .bugBackgroundType
        case .dark: return .darkBackgroundType
        case .dragon: return .dragonBackgroundType
        case .electric: return .electricBackgroundType
        case .fairy: return .fairyBackgroundType
        case .fighting: return .fightingBackgroundType
        case .fire: return .fireBackgroundType
        case .flying: return .flyingBackgroundType
        case .ghost: return .ghostBackgroundType
        case .grass: return .grassBackgroundType
        case .ground: return .groundBackgroundType
        case .ice: return .iceBackgroundType
        case .normal: return .normalBackgroundType
        case .poison: return .poisonBackgroundType
        case .psychic: return .psychicBackgroundType
        case .rock: return .rockBackgroundType
        case .steel: return .steelBackgroundType
        case .water: return .waterBackgroundType
        }
    }
}
