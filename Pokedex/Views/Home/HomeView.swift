//
//  HomeView.swift
//  Pokedex
//
//  Created by nicolas.e.manograsso on 13/12/2022.
//

import SwiftUI

struct HomeView<Model>: View where Model: HomeViewModelProtocol {
    @ObservedObject private var viewModel: Model
    
    init(viewModel: Model = HomeViewModel()) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        ScrollView {
            ZStack {
                GeometryReader { geo in
                    PokeballGradient()
                        .frame(width: geo.size.width, height: geo.size.width)
                        .padding(.top, -(geo.size.width / 2))
                        .ignoresSafeArea()
                }
                
                VStack(alignment: .leading) {
                    Text("Pokedex")
                        .font(.title.bold())
                        .padding(.bottom, 10)
                    
                    Text("Search for Pokémon by name or using the National Pokédex number")
                        .foregroundColor(.textGrey)
                    
                    ForEach(viewModel.pokemons, id: \.id) { pokemon in
                        PokemonCell(pokemon: pokemon,
                                    image: viewModel.getImageById(pokemon.id))
                        .onAppear {
                            viewModel.loadMoreContentIfNeeded(currentItem: pokemon.id)
                        }
                    }
                    
                    if viewModel.isFetching {
                        ProgressView()
                    }
                }
            }
            .padding()
        }
        .onAppear(perform: viewModel.fetchPokemons)
        .preferredColorScheme(.light)
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
