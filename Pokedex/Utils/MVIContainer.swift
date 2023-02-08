//
//  MVIContainer.swift
//  Pokedex
//
//  Created by nicolas.e.manograsso on 31/01/2023.
//

import SwiftUI
import Combine

final class MVIContainer<Intent, Model>: ObservableObject {
    // MARK: Public
    let intent: Intent
    let model: Model

    // MARK: private
    private var cancellable: Set<AnyCancellable> = []

    // MARK: Life cycle
    init(intent: Intent, model: Model, modelChangePublisher: ObjectWillChangePublisher) {
        self.intent = intent
        self.model = model

        modelChangePublisher
            .receive(on: RunLoop.main)
            .sink(receiveValue: objectWillChange.send)
            .store(in: &cancellable)
    }
}
