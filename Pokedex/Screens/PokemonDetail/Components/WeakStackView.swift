//
//  WeakStackView.swift
//  Pokedex
//
//  Created by nicolas.e.manograsso on 08/02/2023.
//

import SwiftUI

struct WeakStackView: View {
    private let title = "Weaknesses"
    private let weaknesses: [PokemonType]
    
    init(value: [PokemonType]) {
        self.weaknesses = value
    }
    
    var body: some View {
        HStack {
            Text(title)
                .foregroundColor(.textBlack)
                .font(.pokemonType)
                .frame(width: 96, alignment: .leading)
            
                ForEach(weaknesses, id: \.self) { weakness in
                    weakness.iconImage
                        .resizable()
                        .scaledToFit()
                        .foregroundColor(.white)
                        .frame(width: 15, height: 15)
                        .padding(5)
                        .background(weakness.iconColor)
                        .clipShape(RoundedRectangle(cornerRadius: 3))
                }
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(.bottom, 16)
    }
}

struct WeakStackView_Previews: PreviewProvider {
    static var previews: some View {
        WeakStackView(value: [.bug, .dark,
                              .dragon, .electric,
                              .fire, .flying,
                              .fairy])
    }
}
