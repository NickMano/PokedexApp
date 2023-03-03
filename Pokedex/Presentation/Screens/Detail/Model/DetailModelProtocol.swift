//
//  DetailModelProtocol.swift
//  Pokedex
//
//  Created by nicolas.e.manograsso on 01/02/2023.
//

import SwiftUI
import PokedexDomain

// MARK: - View State
protocol DetailModelStateProtocol {
    var contentState: DetailTypes.Model.ContentState { get }
    var backgroundColor: Color? { get }
    var name: String { get }
    var image: Image? { get }
    var pokemon: Pokemon { get }
}

// MARK: - Intent Actions
protocol DetailModelActionsProtocol: AnyObject {
    func setupScreen(pokemonData: Pokemon, image: Image?)
}
