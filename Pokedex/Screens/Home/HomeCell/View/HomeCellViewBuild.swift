//
//  HomeCellViewBuild.swift
//  Pokedex
//
//  Created by nicolas.e.manograsso on 31/01/2023.
//

import SwiftUI

extension HomeCellView {
    static func build(data: Pokemon) -> some View {
        let model = HomeCellModel(pokemonInfo: data)
        let intent = HomeCellIntent(model: model, pokemon: data, service: PokemonService())
        let container = MVIContainer(intent: intent as HomeCellIntentProtocol,
                                     model: model as HomeCellModelStateProtocol,
                                     modelChangePublisher: model.objectWillChange)
        let view = HomeCellView(container: container)
        return view
    }
}
