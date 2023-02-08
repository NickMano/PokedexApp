//
//  PokemonInfo.swift
//  Pokedex
//
//  Created by nicolas.e.manograsso on 14/12/2022.
//

import SwiftUI

enum PokemonInfoType {
    case home
    case detail
    
    var numberFont: Font {
        switch self {
        case .home:
            return .pokemonNumber

        case .detail:
            return .filterTitle
        }
    }
    
    var nameFont: Font {
        switch self {
        case .home:
            return .pokemonName

        case .detail:
            return .applicationTitle
        }
    }
}

struct PokemonInfo: View {
    struct StateViewModel: Hashable {
        let number: String
        let name: String
        let types: [PokemonType]
        let format: PokemonInfoType
    }
    
    @State var state: StateViewModel
    
    var body: some View {
        VStack(alignment: .leading) {
            Spacer()
            
            Text(state.number)
                .foregroundColor(.textNumber)
                .font(state.format.numberFont)
            
            Text(state.name.capitalized)
                .foregroundColor(Color(uiColor: .systemBackground))
                .font(state.format.nameFont)
            
            HStack {
                ForEach(state.types, id: \.self.name) { type in
                    PokemonTypeView(type: type)
                }
            }
            .padding(.top, -10)
            
            Spacer()
        }
    }
}

struct PokemonInfo_Previews: PreviewProvider {
    static let bulbasaur: Pokemon = Bundle.main.decode(file: "Bulbasaur", extesion: "json")
    
    static let homeFormat = PokemonInfo.StateViewModel(number: bulbasaur.name,
                                                name: "#001",
                                                types: bulbasaur.pokeTypes,
                                                format: .home)
    
    static let detailFormat = PokemonInfo.StateViewModel(number: bulbasaur.name,
                                                name: "#001",
                                                types: bulbasaur.pokeTypes,
                                                format: .detail)
    
    static var previews: some View {
        ZStack {
            Color.grassBackgroundType
                .ignoresSafeArea()
            
            VStack {
                PokemonInfo(state: homeFormat)
                PokemonInfo(state: detailFormat)
            }
        }
    }
}
