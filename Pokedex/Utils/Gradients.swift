//
//  Gradients.swift
//  Pokedex
//
//  Created by nicolas.e.manograsso on 24/10/2022.
//

import SwiftUI

extension Gradient {
    static let pokeballGradient = Gradient(stops: [Stop(color: .cultured, location: 0.6),
                                                   Stop(color: .white, location: 1)])

    static let vectorGradient = Gradient(stops: [Stop(color: .white.opacity(0.3), location: 0),
                                                 Stop(color: .white.opacity(0), location: 1)])
}
