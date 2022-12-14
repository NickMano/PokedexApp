//
//  PokemonCell.swift
//  Pokedex
//
//  Created by nicolas.e.manograsso on 13/12/2022.
//

import SwiftUI

struct PokemonCell: View {
    private let pokemon: Pokemon
    private let pokemonImage: Image?
    
    init(pokemon: Pokemon, image: Image?) {
        self.pokemon = pokemon
        pokemonImage = image
    }
    
    var body: some View {
        ZStack {
            ZStack {
                pokemon.pokeTypes.first?.backgroundColor
                    .cornerRadius(10)
                
                LinearGradient(gradient: .vectorGradient, startPoint: .top, endPoint: .bottom)
                    .mask(Image.dotsMedium
                        .resizable()
                        .scaledToFit()
                    )
                    .padding(.top, 8)
                    .padding(.bottom, 78)
                    .padding(.trailing)
                
                HStack {
                    Spacer()
                    
                    LinearGradient(gradient: .vectorGradient, startPoint: .top, endPoint: .bottom)
                        .mask(Image.pokeball
                            .resizable()
                            .scaledToFit()
                        )
                        .frame(width: 140, height: 140)
                        .padding(.vertical, -16)
                        .padding(.trailing, -16)
                }
                
                HStack {
                    VStack(alignment: .leading) {
                        Text(pokemon.numberFormatted)
                            .foregroundColor(.textNumber)
                            .font(.pokemonNumber)
                        
                        Text(pokemon.name.capitalized)
                            .foregroundColor(Color(uiColor: .systemBackground))
                            .font(.pokemonName)
                        
                        HStack {
                            ForEach(pokemon.pokeTypes, id: \.self.name) { type in
                                PokemonTypeView(type: type)
                            }
                        }
                        .padding(.top, -10)
                        
                        Spacer()
                    }
                    .padding(.leading, 20)
                    .padding(.top, 20)
                    
                    Spacer()
                }
            }
            .padding(.top, 25)
            
            HStack {
                Spacer()

                if let pokemonImage {
                    pokemonImage
                        .resizable()
                        .scaledToFit()
                        .padding(.trailing, 20)
                } else {
                    ProgressView()
                        .padding(.trailing, 42)
                        .padding(.top, 24)
                }
            }
        }
        .frame(height: 140)
    }
}

struct PokemonCell_Previews: PreviewProvider {
    static let bulbasaur: Pokemon = Bundle.main.decode(file: "Bulbasaur", extesion: "json")
    
    static var previews: some View {
        PokemonCell(pokemon: bulbasaur, image: nil)
    }
}
