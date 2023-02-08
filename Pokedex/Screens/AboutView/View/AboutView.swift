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
            Text(state.description)
                .font(.description)
                .foregroundColor(.textGrey)
                .padding(.top, 40)
                .padding(.bottom, 32)
            
            pokedexDataView()
            trainingView()
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
    func pokedexDataView() -> some View {
        VStack(alignment: .leading) {
            Text("Pokedex Data")
                .foregroundColor(state.sectionColor)
                .font(.filterTitle)
                .padding(.bottom, 4)
            
            switch state.speciesState {
            case .fetched(let species):
                DataStackView(title: "Species", value: species)
                
            default:
                EmptyView()
            }
            
            DataStackView(title: "Height", value: state.height)
            DataStackView(title: "Weight", value: state.weight)
            AbilityStackView(abilities: state.abilities)
        }
    }
    
    func trainingView() -> some View {
        VStack(alignment: .leading) {
            Text("Training")
                .foregroundColor(state.sectionColor)
                .font(.filterTitle)
                .padding(.bottom, 4)
            
                DataStackView(title: "EV Yield", value: state.baseExperience)
                DataStackView(title: "Catch Rate", value: state.baseExperience)
                DataStackView(title: "Base Friendship", value: state.baseExperience)
                DataStackView(title: "Base Exp", value: state.baseExperience)
                DataStackView(title: "Growth Rate", value: state.baseExperience)
        }
    }
    
    func breedingView() -> some View {
        VStack(alignment: .leading) {
            Text("Breeding")
                .foregroundColor(state.sectionColor)
                .font(.filterTitle)
                .padding(.bottom, 4)
        }
    }
}

struct PokemonAboutView_Previews: PreviewProvider {
    static let bulbasaur: Pokemon = Bundle.main.decode(file: "Bulbasaur", extesion: "json")
    
    static var previews: some View {
        AboutView.build(data: bulbasaur)
    }
}
