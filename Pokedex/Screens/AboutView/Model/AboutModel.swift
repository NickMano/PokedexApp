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
    @Published private(set) var growthRate = ""
    @Published private(set) var isPokemonLoaded = false
    
    @Published private(set) var weaknesses: [PokemonType] = []
    
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
    
    var evYield: String {
        let stats = pokemon.stats
        guard let evStat = stats.first(where: { $0.effort > 0 }) else {
            return ""
        }
        
        let value = evStat.effort
        let name = formatString(evStat.stat.name)
        
        return "\(value) \(name)"
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
        growthRate = formatString(species.growthRate.name)
        speciesState = .fetched(species.speciesName)
    }
    
    func update(_ types: [TypeResponse]) {
        let damageRelations = types.map { $0.damageRelations }
        
        let partialWeaknessess = damageRelations.flatMap { $0.doubleDamageFrom.map { $0.name } }
        let resistences = damageRelations.flatMap {
            $0.halfDamageFrom.map { $0.name } + $0.noDamageFrom.map { $0.name }
        }
        
        let weaknesses = partialWeaknessess.filter { !resistences.contains($0) }
        
        let types = weaknesses.compactMap { PokemonType(rawValue: $0) }
        self.weaknesses = Array(Set(types))
    }
}

// MARK: - Private methods
private extension AboutModel {
    func setSectionColor() {
        sectionColor = pokemon.pokeTypes.first?.iconColor
    }
    
    func formatString(_ value: String) -> String {
        let valueWithoutDashes = value.replaceDashWithSpace
        return valueWithoutDashes.capitalized
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
