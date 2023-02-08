//
//  AboutView.swift
//  Pokedex
//
//  Created by nicolas.e.manograsso on 15/12/2022.
//

import SwiftUI

struct AboutView<Model>: View where Model: AboutViewModelProtocol {
    @ObservedObject private var viewModel: Model
    
    init(viewModel: Model) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(viewModel.description)
                .font(.description)
                .foregroundColor(.textGrey)
                .padding(.top, 40)
                .padding(.bottom, 32)
            
            PokedexDataView(viewModel: viewModel)
            TrainingView(viewModel: viewModel)
            
            Spacer()
        }
        .frame(maxWidth: .infinity)
        .padding(.horizontal, 40)
        .onAppear(perform: viewModel.fetchSpecies)
    }
}

struct PokedexDataView<Model>: View where Model: AboutViewModelProtocol {
    @ObservedObject private var viewModel: Model
    
    init(viewModel: Model) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Pokedex Data")
                .foregroundColor(viewModel.backgroundColor)
                .font(.filterTitle)
                .padding(.bottom, 4)
            
            DataStackView(title: "Species", value: viewModel.speciesName)
            DataStackView(title: "Height", value: viewModel.pokemonHeight)
            DataStackView(title: "Weight", value: viewModel.pokemonWeight)
            AbilityStackView(abilities: viewModel.pokemonAbilities)
        }
    }
}

struct TrainingView<Model>: View where Model: AboutViewModelProtocol {
    @ObservedObject private var viewModel: Model
    
    init(viewModel: Model) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Training")
                .foregroundColor(viewModel.backgroundColor)
                .font(.filterTitle)
                .padding(.bottom, 4)
            
            DataStackView(title: "EV Yield", value: viewModel.speciesName)
            DataStackView(title: "Catch Rate", value: viewModel.speciesName)
            DataStackView(title: "Base Friendship", value: viewModel.speciesName)
            DataStackView(title: "Base Exp", value: viewModel.baseExperience)
            DataStackView(title: "Growth Rate", value: viewModel.speciesName)
        }
    }
}

struct PokemonAboutView_Previews: PreviewProvider {
    static let bulbasaur: Pokemon = Bundle.main.decode(file: "Bulbasaur", extesion: "json")
    
    static var previews: some View {
        AboutView(viewModel: AboutViewModel(pokemon: bulbasaur))
    }
}
