//
//  AboutViewBuild.swift
//  Pokedex
//
//  Created by nicolas.e.manograsso on 02/02/2023.
//

import SwiftUI

extension AboutView {
    static func build(data: Pokemon) -> some View {
        let model = AboutModel()
        let intent = AboutIntent(model: model, externalData: data, service: PokemonService())
        let container = MVIContainer(intent: intent as AboutIntentProtocol,
                                     model: model as AboutModelStateProtocol,
                                     modelChangePublisher: model.objectWillChange)
        let view = AboutView(container: container)
        return view
    }
}
