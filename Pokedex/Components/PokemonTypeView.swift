//
//  PokemonTypeView.swift
//  Pokedex
//
//  Created by nicolas.e.manograsso on 13/12/2022.
//

import SwiftUI

struct PokemonTypeView: View {
    private let type: PokemonType
    
    init(type: PokemonType) {
        self.type = type
    }
    
    var body: some View {
        HStack {
            type.iconImage
                .resizable()
                .scaledToFit()
                .foregroundColor(.white)
                .padding(.vertical, 4)
                .padding(.leading, 4)
            
            Text(type.name)
                .foregroundColor(.white)
                .font(.pokemonType)
                .padding(.trailing, 4)
        }
        .background(type.iconColor)
        .frame(height: 24)
        .cornerRadius(4)
    }
}

struct PokemonTypeView_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            ForEach(PokemonType.allCases, id: \.self) { type in
                PokemonTypeView(type: type)
            }
        }
    }
}
