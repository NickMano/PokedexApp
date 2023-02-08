//
//  DataStackView.swift
//  Pokedex
//
//  Created by nicolas.e.manograsso on 15/12/2022.
//

import SwiftUI

struct DataStackView: View {
    private let title: String
    private let value: String
    
    init(title: String, value: String) {
        self.title = title
        self.value = value
    }
    
    var body: some View {
            HStack {
                Text(title)
                    .foregroundColor(.textBlack)
                    .font(.pokemonType)
                    .frame(width: 96, alignment: .leading)
                
                Text(value)
                    .foregroundColor(.textGrey)
                    .font(.description)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.bottom, 16)
    }
}

struct DataStackView_Previews: PreviewProvider {
    static var previews: some View {
        DataStackView(title: "Base Friendship", value: "Overgrow")
    }
}
