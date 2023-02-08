//
//  HomeViewBuild.swift
//  Pokedex
//
//  Created by nicolas.e.manograsso on 31/01/2023.
//

import SwiftUI

extension HomeView {
    static func build() -> some View {
        let model = HomeModel()
        let intent = HomeIntent(model: model, service: PokemonService())
        let container = MVIContainer(intent: intent as HomeIntentProtocol,
                                     model: model as HomeModelStateProtocol,
                                     modelChangePublisher: model.objectWillChange)
        let view = HomeView(container: container)
        return view
    }
}
