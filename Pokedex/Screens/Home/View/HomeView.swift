//
//  HomeView.swift
//  Pokedex
//
//  Created by nicolas.e.manograsso on 13/12/2022.
//

import SwiftUI

struct HomeView: View {
    @StateObject var container: MVIContainer<HomeIntentProtocol, HomeModelStateProtocol>
    
    private var intent: HomeIntentProtocol { container.intent }
    private var state: HomeModelStateProtocol { container.model }
    
    var body: some View {
        NavigationView {
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
                        
                        switch state.contentState {
                        case .loading:
                            ProgressView()

                        case .fetched(let pokemons):
                            ListPokemonsView(intent: intent, pokemons: pokemons)
                        
                        case .error:
                            EmptyView()
                        }
                    }
                }
                .padding()
            }
        }
        .onAppear(perform: intent.viewOnAppear)
        .preferredColorScheme(.light)
    }
}

 private extension HomeView {
    // ListPokemonsView
    private struct ListPokemonsView: View {
        let intent: HomeIntentProtocol
        let pokemons: [Pokemon]

        var body: some View {
            LazyVStack {
                ForEach(pokemons, id: \.id) {
                    HomeCellView.build(data: $0)
                }
            }
        }
    }
 }

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView.build()
    }
}
