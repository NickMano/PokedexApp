//
//  Gradients.swift
//  Pokedex
//
//  Created by nicolas.e.manograsso on 24/10/2022.
//

import UIKit

extension GradientColor {
    static let pokeballGradient = [GradientColor(color: .cultured, location: 0.5),
                                   GradientColor(color: .white, location: 0)]

    static let vectorGradient = [GradientColor(color: .white.withAlphaComponent(0.3), location: 1),
                                 GradientColor(color: .white.withAlphaComponent(0), location: 0)]
}
