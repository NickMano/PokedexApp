//
//  AbilityStackView.swift
//  Pokedex
//
//  Created by nicolas.e.manograsso on 15/12/2022.
//

import SwiftUI

struct AbilityStackView: View {
    private let title: String = "Abilities"
    private let abilities: [Ability]
    
    init(abilities: [Ability]) {
        self.abilities = abilities
    }
    
    var body: some View {
        HStack {
            Text(title)
                .foregroundColor(.textBlack)
                .font(.pokemonType)
                .frame(width: 96, alignment: .leading)
            
            VStack(alignment: .leading) {
                ForEach(abilities, id: \.ability.name) { ability in
                    Text(getAbilityNameFormatted(ability))
                        .foregroundColor(.textGrey)
                        .font( ability.isHidden ? .pokemonType : .description)
                }
            }
        }
        .padding(.bottom, 16)
    }
    
    func getAbilityNameFormatted(_ ability: Ability) -> String {
        var name = ability.ability.name
        
        name = name.replaceDashWithSpace
        name = name.capitalized
        
        if ability.isHidden {
            name = "\(name) (hidden ability)"
        } else {
            name = "\(ability.slot). \(name)"
        }
        
        return name
    }
}

struct AbilityStackView_Previews: PreviewProvider {
    static let bulbasaur: Pokemon = Bundle.main.decode(file: "Nidoking", extesion: "json")
    
    static var previews: some View {
        AbilityStackView(abilities: bulbasaur.abilities)
    }
}
