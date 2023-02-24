//
//  AboutModel.swift
//  Pokedex
//
//  Created by nicolas.e.manograsso on 02/02/2023.
//

import SwiftUI

final class AboutModel: ObservableObject, AboutModelStateProtocol {
    @Published private(set) var speciesState: AboutTypes.Model.State = .loading
    @Published private(set) var eggGroupsState: AboutTypes.Model.State = .loading
    
    @Published private(set) var description = ""
    @Published private(set) var isPokemonLoaded = false
    
    @Published private(set) var pokedexData = PokedexDataModel()
    @Published private(set) var trainingData = TrainingModel()
    @Published private(set) var breedingData = BreedingModel()
    
    private var pokemon = Pokemon()
    
    private(set) var sectionColor: Color?
}

extension AboutModel: AboutModelActionsProtocol {
    func setupScreen(_ pokemon: Pokemon) {
        self.pokemon = pokemon
        
        setSectionColor()
        setPokedexData()
        
        isPokemonLoaded = true
    }
    
    func displaySpeciesLoading() {
        speciesState = .loading
    }
    
    func update(_ species: PokemonSpecies) {
        description = species.description.replacingOccurrences(of: "\n", with: " ")
        pokedexData.species = species.speciesName
        
        setTrainigData(species)
        setBreedingData(species)
        
        speciesState = .fetched
    }
    
    func update(_ types: [TypeResponse]) {
        let damageRelations = types.map { $0.damageRelations }
        
        let partialWeaknessess = damageRelations.flatMap { $0.doubleDamageFrom.map { $0.name } }
        let resistences = damageRelations.flatMap {
            $0.halfDamageFrom.map { $0.name } + $0.noDamageFrom.map { $0.name }
        }
        
        let weaknesses = partialWeaknessess.filter { !resistences.contains($0) }
        
        let types = weaknesses.compactMap { PokemonType(rawValue: $0) }
        pokedexData.weaknesses = Array(Set(types))
    }
    
    func displayEggGroupsLoading() {
        eggGroupsState = .loading
    }
    
    func update(_ eggGroups: [EggGroup]) {
        if eggGroups.count == 1, let eggGroup = eggGroups.first {
            setEggGroup(eggGroup)
            return
        }
        
        setEggGroups(eggGroups)
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

// MARK: - Pokedex Data methods
private extension AboutModel {
    func setPokedexData() {
        pokedexData = PokedexDataModel(species: pokedexData.species,
                                       height: getHeight(),
                                       weight: getWeight(),
                                       abilities: pokemon.abilities,
                                       weaknesses: pokedexData.weaknesses)
    }
    
    func getHeight() -> (String, String) {
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
    
    func getWeight() -> (String, String) {
        let value = Double(pokemon.weight) / 10
        let kilo = Measurement(value: value, unit: UnitMass.kilograms)
        let lbs = kilo.converted(to: .pounds)
        
        let kiloString = String(format: "%.1fkg", kilo.value)
        let lbsString = String(format: "%.1f lbs", lbs.value)
        
        return (kiloString, lbsString)
    }
}

// MARK: - Training Data Methods
private extension AboutModel {
    func setTrainigData(_ species: PokemonSpecies) {
        let baseHappinessText: String
        
        if let baseHappiness = species.baseHappiness {
            baseHappinessText = String(baseHappiness)
        } else {
            baseHappinessText = "-"
        }
        
        trainingData = TrainingModel(evYield: getEvYield(),
                                     catchRate: "\(species.catchRate)",
                                     baseFriendship: baseHappinessText,
                                     baseExp: getBaseExperience(),
                                     growthRate: formatString(species.growthRate.name))
    }
    
    func getEvYield() -> [String] {
        let stats = pokemon.stats
        let evStats = stats.filter { $0.effort > 0 }
        
        let values = evStats.map { "\($0.effort) \(formatString($0.stat.name))" }
        return values
    }
    
    func getBaseExperience() -> String {
        guard let exp = pokemon.baseExperience else {
            return "-"
        }
        
        return String(exp)
    }
}

// MARK: - Breeding Data Methods
private extension AboutModel {
    func setBreedingData(_ species: PokemonSpecies) {
        breedingData.gender = species.genderRate
    }
    
    func setEggGroup(_ model: EggGroup) {
        let groupName = getEggGroupName(model)
        breedingData.eggGroups = groupName
        
        eggGroupsState = .fetched
    }
    
    func setEggGroups(_ groups: [EggGroup]) {
        var text = ""
        
        let names = groups.map { getEggGroupName($0) }
        
        var isFirstGroup = true
        for name in names {
            if isFirstGroup {
                text = name
                isFirstGroup = false
            } else {
                text.append(", \(name)")
            }
        }
        
        breedingData.eggGroups = text
        eggGroupsState = .fetched
    }
    
    func getEggGroupName(_ eggGroup: EggGroup) -> String {
        if let nameModel = eggGroup.names.first(where: { $0.language.name == "en" }) {
            return nameModel.name
        } else {
            return ""
        }
    }
}

// MARK: - Helper Classes
extension AboutTypes.Model {
    enum State {
        case loading
        case fetched
        case error
    }
}
