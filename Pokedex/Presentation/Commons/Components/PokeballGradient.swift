//
//  PokeballGradient.swift
//  Pokedex
//
//  Created by nicolas.e.manograsso on 13/12/2022.
//

import SwiftUI

struct PokeballGradient: View {
    var body: some View {
        LinearGradient(gradient: .pokeballGradient, startPoint: .top, endPoint: .bottom)
            .mask(Image.pokeball
                .resizable()
                .scaledToFit()
            )
    }
}

struct PokeballGradient_Previews: PreviewProvider {
    static var previews: some View {
        PokeballGradient()
    }
}
