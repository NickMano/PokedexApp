//
//  AboutViewModel.swift
//  Pokedex
//
//  Created by nicolas.e.manograsso on 15/12/2022.
//

import Foundation
import SwiftUI

protocol AboutViewModelProtocol: ObservableObject {
    var description: String { get }
    var speciesName: String { get }
    var pokemonWeight: String { get }
    var pokemonHeight: String { get }
    var backgroundColor: Color { get }
    var pokemonAbilities: [Ability] { get }
    var baseExperience: String { get }
    
    func fetchSpecies()
}

class AboutViewModel: AboutViewModelProtocol {
    // MARK: - Properties
    @Published private(set) var description: String = ""
    @Published private(set) var speciesName: String = ""
    
    private let pokemon: Pokemon
    private let service: PokemonServiceProtocol
    
    var pokemonWeight: String {
        let weight = Double(pokemon.weight) / 10
        
        return "\(weight)m"
    }
    
    var pokemonHeight: String {
        let height = Double(pokemon.height) / 10
        
        return "\(height)kg"
    }
    
    var backgroundColor: Color {
        pokemon.pokeTypes.first?.iconColor ?? .white
    }
    
    var pokemonAbilities: [Ability] {
        pokemon.abilities
    }
    
    var baseExperience: String {
        "\(pokemon.baseExperience ?? 0)"
    }
    
    // MARK: - Initializers
    init(pokemon: Pokemon, service: PokemonServiceProtocol = PokemonService()) {
        self.pokemon = pokemon
        self.service = service
    }
    
    // MARK: - Public methods
    @MainActor
    func fetchSpecies() {
        Task {
            do {
                let species = try await service.fetchSpecies(pokemon.id)
                
                speciesName = species.speciesName
                description = species.description.replacingOccurrences(of: "\n", with: " ")
            } catch { }
        }
    }
}
