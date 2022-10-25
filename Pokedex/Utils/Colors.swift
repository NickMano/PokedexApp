//
//  Colors.swift
//  Pokedex
//
//  Created by nicolas.e.manograsso on 24/10/2022.
//

import UIKit
import WolmoCore

extension UIColor {
    static let cultured = UIColor(hex: "#F6F6F6") ?? .black
    
    // Text
    static let textBlack = UIColor(hex: "#17171B") ?? .black
    static let textGrey = UIColor(hex: "#747476") ?? .black
    static let textNumber = UIColor(hex: "#17171B")?.withAlphaComponent(0.6) ?? .black
    
    // Pokemon types
    static let bugType = UIColor(hex: "#8CB230") ?? .black
    static let darkType = UIColor(hex: "#58575F") ?? .black
    static let dragonType = UIColor(hex: "#0F6AC0") ?? .black
    static let electricType = UIColor(hex: "#EED535") ?? .black
    static let fairyType = UIColor(hex: "#ED6EC7") ?? .black
    static let fightingType = UIColor(hex: "#D04164") ?? .black
    static let fireType = UIColor(hex: "#FD7D24") ?? .black
    static let flyingType = UIColor(hex: "#748FC9") ?? .black
    static let ghostType = UIColor(hex: "#556AAE") ?? .black
    static let grassType = UIColor(hex: "#62B957") ?? .black
    static let groundType = UIColor(hex: "#DD7748") ?? .black
    static let iceType = UIColor(hex: "#61CEC0") ?? .black
    static let normalType = UIColor(hex: "#9DA0AA") ?? .black
    static let poisonType = UIColor(hex: "#A552CC") ?? .black
    static let psychicType = UIColor(hex: "#EA5D60") ?? .black
    static let rockType = UIColor(hex: "#BAAB82") ?? .black
    static let steelType = UIColor(hex: "#417D9A") ?? .black
    static let waterType = UIColor(hex: "#4A90DA") ?? .black
    
    // Pokemon types background
    static let bugBackgroundType = UIColor(hex: "#8BD674") ?? .black
    static let darkBackgroundType = UIColor(hex: "#6F6E78") ?? .black
    static let dragonBackgroundType = UIColor(hex: "#7383B9") ?? .black
    static let electricBackgroundType = UIColor(hex: "#F2CB55") ?? .black
    static let fairyBackgroundType = UIColor(hex: "#EBA8C3") ?? .black
    static let fightingBackgroundType = UIColor(hex: "#EB4971") ?? .black
    static let fireBackgroundType = UIColor(hex: "#FFA756") ?? .black
    static let flyingBackgroundType = UIColor(hex: "#83A2E3") ?? .black
    static let ghostBackgroundType = UIColor(hex: "#8571BE") ?? .black
    static let grassBackgroundType = UIColor(hex: "#8BBE8A") ?? .black
    static let groundBackgroundType = UIColor(hex: "#F78551") ?? .black
    static let iceBackgroundType = UIColor(hex: "#91D8DF") ?? .black
    static let normalBackgroundType = UIColor(hex: "#B5B9C4") ?? .black
    static let poisonBackgroundType = UIColor(hex: "#9F6E97") ?? .black
    static let psychicBackgroundType = UIColor(hex: "#FF6568") ?? .black
    static let rockBackgroundType = UIColor(hex: "#D4C294") ?? .black
    static let steelBackgroundType = UIColor(hex: "#4C91B2") ?? .black
    static let waterBackgroundType = UIColor(hex: "#58ABF6") ?? .black
}
