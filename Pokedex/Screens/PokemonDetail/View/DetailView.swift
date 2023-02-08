//
//  PokemonDetailView.swift
//  Pokedex
//
//  Created by nicolas.e.manograsso on 14/12/2022.
//

import SwiftUI

struct PokemonDetailView: View {
    private let pokemon: Pokemon
    private let image: Image?
    
    init(_ pokemon: Pokemon,
         image: Image?) {
        self.pokemon = pokemon
        self.image = image
    }
    
    var body: some View {
        NavigationView {
            ZStack {
                pokemon.pokeTypes.first?.backgroundColor
                    .ignoresSafeArea()
                
                VStack {
                    LinearGradient(gradient: .vectorGradient, startPoint: .top, endPoint: .bottom)
                        .mask(
                            Text(pokemon.name.uppercased())
                                .font(.hugeTitle)
                                .lineLimit(1)
                                .frame(width: 2000)
                        )
                        .frame(height: 100)
                    
                    Spacer()
                }
                
                ScrollView {
                    HStack(alignment: .center) {
                        image?
                            .resizable()
                            .scaledToFit()
                            .frame(maxWidth: 160, maxHeight: 160)
                            .padding(.trailing, 24)
                        
                        PokemonInfo(state: PokemonInfo.StateViewModel(number: pokemon.numberFormatted,
                                                                      name: pokemon.name,
                                                                      types: pokemon.pokeTypes,
                                                                      format: .detail))
                    }
                    .padding()
                    
                    PokemonAboutView(viewModel: PokemonAboutViewModel(pokemon: pokemon))
                        .background(.white)
                }
            }
        }
    }
}

struct PokemonDetailView_Previews: PreviewProvider {
    static let bulbasaur: Pokemon = Bundle.main.decode(file: "Bulbasaur", extesion: "json")
    
    static var previews: some View {
        PokemonDetailView(bulbasaur, image: .bulbasaur)
    }
}
