//
//  AboutView.swift
//  Pokedex
//
//  Created by nicolas.e.manograsso on 15/12/2022.
//

import SwiftUI

struct AboutView: View {
    @StateObject var container: MVIContainer<AboutIntentProtocol, AboutModelStateProtocol>
    
    private var intent: AboutIntentProtocol { container.intent }
    private var state: AboutModelStateProtocol { container.model }
    
    var body: some View {
        VStack(alignment: .leading) {
            switch state.speciesState {
            case.fetched:
                Text(state.description)
                    .font(.description)
                    .foregroundColor(.textNumber)
                    .padding(.top, 40)
                    .padding(.bottom, 32)

            case .loading:
                VStack(alignment: .leading) {
                    Capsule()
                        .frame(height: 8)
                        .foregroundColor(.textGrey)
                    
                    Capsule()
                        .frame(height: 8)
                        .foregroundColor(.textGrey)
                    
                    Capsule()
                        .frame(width: 100, height: 8)
                        .foregroundColor(.textGrey)
                }
                .padding(.top, 40)
                .padding(.bottom, 32)

            case .error:
                EmptyView()
            }
            
            pokedexDataView(state.pokedexData)
            trainingView(state.trainingData)
            breedingView()
            
            Spacer()
        }
        .frame(maxWidth: .infinity)
        .padding(.horizontal, 40)
        .onAppear(perform: intent.viewOnAppear)
    }
}

// MARK: - Views
private extension AboutView {
    func pokedexDataView(_ data: PokedexDataModel) -> some View {
        VStack(alignment: .leading) {
            Text("Pokedex Data")
                .foregroundColor(state.sectionColor)
                .font(.filterTitle)
                .padding(.bottom, 4)
            
            switch state.speciesState {
            case .fetched:
                DataStackView(title: "Species", value: data.species)
                
            default:
                EmptyView()
            }
            
            DataStackView(title: "Height", value: data.height)
            DataStackView(title: "Weight", value: data.weight)
            AbilityStackView(abilities: data.abilities)
            WeakStackView(value: data.weaknesses)
        }
    }
    
    func trainingView(_ data: TrainingModel) -> some View {
        VStack(alignment: .leading) {
            Text("Training")
                .foregroundColor(state.sectionColor)
                .font(.filterTitle)
                .padding(.bottom, 4)
            
                DataStackView(title: "EV Yield", values: data.evYield)
                DataStackView(title: "Catch Rate", value: data.catchRate)
                DataStackView(title: "Base Friendship", value: data.baseFriendship)
                DataStackView(title: "Base Exp", value: data.baseExp)
                DataStackView(title: "Growth Rate", value: data.growthRate)
        }
    }
    
    func breedingView() -> some View {
        VStack(alignment: .leading) {
            Text("Breeding")
                .foregroundColor(state.sectionColor)
                .font(.filterTitle)
                .padding(.bottom, 4)
            
            DataStackView(title: "Egg Gropus", value: state.pokedexData.weight)
        }
    }
}

struct PokemonAboutView_Previews: PreviewProvider {
    static let bulbasaur: Pokemon = Bundle.main.decode(file: "Bulbasaur", extesion: "json")
    
    static var previews: some View {
        AboutView.build(data: bulbasaur)
    }
}
