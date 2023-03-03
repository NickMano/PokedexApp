//
//  HomeModelProtocol.swift
//  Pokedex
//
//  Created by nicolas.e.manograsso on 31/01/2023.
//

import PokedexDomain

// MARK: - View State
protocol HomeModelStateProtocol {
    var contentState: HomeTypes.Model.ContentState { get }
}

// MARK: - Intent Actions
protocol HomeModelActionsProtocol: AnyObject {
    func displayLoading()
    func displayError()
    func update(pokemons: [Pokemon])
}
