//
//  DetailView.swift
//  Pokedex
//
//  Created by nicolas.e.manograsso on 14/12/2022.
//

import SwiftUI

struct DetailView: View {
    @StateObject var container: MVIContainer<DetailIntentProtocol, DetailModelStateProtocol>
    
    private var intent: DetailIntentProtocol { container.intent }
    private var state: DetailModelStateProtocol { container.model }
    
    var body: some View {
        NavigationView {
            ZStack {
                LinearGradient(
                    gradient: Gradient(stops: [
                        Gradient.Stop(color: state.backgroundColor ?? .normalType, location: 0.5),
                        Gradient.Stop(color: .white, location: 0.5)
                    ]),
                    startPoint: .top,
                    endPoint: .bottom)
                .ignoresSafeArea()
                
                VStack {
                    LinearGradient(gradient: .vectorGradient, startPoint: .top, endPoint: .bottom)
                        .mask(
                            Text(state.name)
                                .font(.hugeTitle)
                                .lineLimit(1)
                                .frame(width: 2000)
                        )
                        .frame(height: 100)
                    
                    Spacer()
                }
                
                ScrollView {
                    HStack(alignment: .center) {
                        state.image?
                            .resizable()
                            .scaledToFit()
                            .frame(maxWidth: 160, maxHeight: 160)
                            .padding(.trailing, 24)
                        
                        switch state.contentState {
                        case .fetched(let pokemonInfo):
                            PokemonInfo(state: pokemonInfo)

                        default:
                            EmptyView()
                        }
                    }
                    .padding()
                    
                    switch state.contentState {
                    case .fetched:
                        AboutView.build(data: state.pokemon)
                            .background(.white)
                            .cornerRadius(24)

                    default:
                        EmptyView()
                    }
                }
            }
        }
        .onAppear(perform: intent.viewOnAppear)
    }
}

struct PokemonDetailView_Previews: PreviewProvider {
    static let bulbasaur: Pokemon = Bundle.main.decode(file: "Bulbasaur", extesion: "json")
    
    static var previews: some View {
        DetailView.build(data: DetailTypes.Intent.ExternalData(pokemon: bulbasaur, image: .bulbasaur))
    }
}
