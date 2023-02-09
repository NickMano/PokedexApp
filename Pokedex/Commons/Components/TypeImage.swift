//
//  TypeImage.swift
//  Pokedex
//
//  Created by nicolas.e.manograsso on 08/02/2023.
//

import SwiftUI

struct TypeImage: View {
    let type: PokemonType
    
    var body: some View {
        type.iconImage
            .resizable()
            .scaledToFit()
            .foregroundColor(.white)
            .frame(width: 15, height: 15)
            .padding(5)
            .background(type.iconColor)
            .clipShape(RoundedRectangle(cornerRadius: 3))
    }
}

struct TypeImage_Previews: PreviewProvider {
    static var previews: some View {
        TypeImage(type: .fire)
    }
}
