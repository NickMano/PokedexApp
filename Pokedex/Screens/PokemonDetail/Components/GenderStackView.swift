//
//  GenderStackView.swift
//  Pokedex
//
//  Created by nicolas.e.manograsso on 20/02/2023.
//

import SwiftUI

struct GenderStackView: View {
    private let title = "Gender"
    private let chanceToFemaleInEighths: Double
    
    init(chanceToFemaleInEighths: Int) {
        self.chanceToFemaleInEighths = Double(chanceToFemaleInEighths) * 100 / 8
    }
    
    var body: some View {
            HStack {
                Text(title)
                    .foregroundColor(.textBlack)
                    .font(.pokemonType)
                    .frame(width: 96, alignment: .leading)
                
                if isGenderless() {
                    Text("Genderless")
                        .foregroundColor(.textGrey)
                        .font(.description)
                } else {
                    HStack {
                        maleText()
                        Text(",")
                            .foregroundColor(.textGrey)
                            .font(.description)
                        femaleText()
                    }
                }
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.bottom, 16)
    }
    
    func isGenderless() -> Bool {
        chanceToFemaleInEighths < 0
    }
    
    func maleText() -> some View {
        Text("♂︎ \(maleChance())")
            .foregroundColor(.flyingType)
            .font(.description)
    }
    
    func maleChance() -> String {
          "\(100 - chanceToFemaleInEighths)%"
    }
    
    func femaleText() -> some View {
        Text("♀ \(femaleChance())")
            .foregroundColor(.fairyType)
            .font(.description)
    }
    
    func femaleChance() -> String {
          "\(chanceToFemaleInEighths)%"
    }
}

struct GenderStackView_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            GenderStackView(chanceToFemaleInEighths: 1)
            GenderStackView(chanceToFemaleInEighths: -1)
        }
    }
}
