//
//  Fonts.swift
//  Pokedex
//
//  Created by nicolas.e.manograsso on 24/10/2022.
//

import SwiftUI

extension Font {
    static let applicationTitle = Font(CTFont(.system, size: 32)).weight(.bold)
    static let pokemonName = Font(CTFont(.system, size: 26)).weight(.bold)
    static let filterTitle = Font(CTFont(.system, size: 16)).weight(.bold)
    static let description = Font(CTFont(.system, size: 16)).weight(.regular)
    static let pokemonNumber = Font(CTFont(.system, size: 12)).weight(.bold)
    static let pokemonType = Font(CTFont(.system, size: 12)).weight(.medium)
}
