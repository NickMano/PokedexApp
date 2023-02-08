//
//  AboutModel.swift
//  Pokedex
//
//  Created by nicolas.e.manograsso on 02/02/2023.
//

import SwiftUI

final class AboutModel: ObservableObject, AboutModelStateProtocol {
    @Published private(set) var speciesState: AboutTypes.Model.SpeciesState = .loading
    
    @Published private(set) var description = ""
    @Published private(set) var isPokemonLoaded = false
    
    private var pokemon = Pokemon()
    
    private(set) var sectionColor: Color?
    
    var height: (String, String) {
        let value = Double(pokemon.height * 10)
        let centimeters = Measurement(value: value, unit: UnitLength.centimeters)
        let meters = centimeters.converted(to: .meters)
        let feet = centimeters.converted(to: .feet)
        let inches = centimeters.converted(to: .inches)
        
        let feetValue = floor(feet.value)
        let inchesValue = inches.value - feetValue * 12
        
        let metersString = String(format: "%.2fm", meters.value)
        let inchesString = String(format: "%.0f'%02.0f\"", feetValue, inchesValue)
        
        return (metersString, inchesString)
    }
    
    var weight: (String, String) {
        let value = Double(pokemon.weight) / 10
        let kilo = Measurement(value: value, unit: UnitMass.kilograms)
        let lbs = kilo.converted(to: .pounds)
        
        let kiloString = String(format: "%.1fkg", kilo.value)
        let lbsString = String(format: "%.1f lbs", lbs.value)
        
        return (kiloString, lbsString)
    }
    
    var abilities: [Ability] {
        pokemon.abilities
    }
    
    var baseExperience: String {
        guard let exp = pokemon.baseExperience else {
            return ""
        }
        
        return String(exp)
    }
}

extension AboutModel: AboutModelActionsProtocol {
    func setupScreen(_ pokemon: Pokemon) {
        self.pokemon = pokemon
        
        setSectionColor()
        
        isPokemonLoaded = true
    }
    
    func displaySpeciesLoading() {
        speciesState = .loading
    }
    
    func update(_ species: PokemonSpecies) {
        description = species.description.replacingOccurrences(of: "\n", with: " ")
        speciesState = .fetched(species.speciesName)
    }
}

// MARK: - Private methods
private extension AboutModel {
    func setSectionColor() {
        sectionColor = pokemon.pokeTypes.first?.iconColor
    }
}

// MARK: - Helper Classes
extension AboutTypes.Model {
    enum SpeciesState {
        case loading
        case fetched(String)
        case error
    }
}
