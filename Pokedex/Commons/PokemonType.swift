//
//  PokemonType.swift
//  Pokedex
//
//  Created by nicolas.e.manograsso on 24/10/2022.
//

import UIKit

enum PokemonType {
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
    
    var iconImage: UIImage {
        switch self {
        case .bug: return UIImage.bug.withRenderingMode(.alwaysTemplate)
        case .dark: return UIImage.dark.withRenderingMode(.alwaysTemplate)
        case .dragon: return UIImage.dragon.withRenderingMode(.alwaysTemplate)
        case .electric: return UIImage.electric.withRenderingMode(.alwaysTemplate)
        case .fairy: return UIImage.fairy.withRenderingMode(.alwaysTemplate)
        case .fighting: return UIImage.fighting.withRenderingMode(.alwaysTemplate)
        case .fire: return UIImage.fire.withRenderingMode(.alwaysTemplate)
        case .flying: return UIImage.flying.withRenderingMode(.alwaysTemplate)
        case .ghost: return UIImage.ghost.withRenderingMode(.alwaysTemplate)
        case .grass: return UIImage.grass.withRenderingMode(.alwaysTemplate)
        case .ground: return UIImage.ground.withRenderingMode(.alwaysTemplate)
        case .ice: return UIImage.ice.withRenderingMode(.alwaysTemplate)
        case .normal: return UIImage.normal.withRenderingMode(.alwaysTemplate)
        case .poison: return UIImage.poison.withRenderingMode(.alwaysTemplate)
        case .psychic: return UIImage.psychic.withRenderingMode(.alwaysTemplate)
        case .rock: return UIImage.rock.withRenderingMode(.alwaysTemplate)
        case .steel: return UIImage.steel.withRenderingMode(.alwaysTemplate)
        case .water: return UIImage.water.withRenderingMode(.alwaysTemplate)
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
    
    var iconColor: UIColor {
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
    
    var backgroundColor: UIColor {
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
