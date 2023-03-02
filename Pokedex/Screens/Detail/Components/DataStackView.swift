//
//  DataStackView.swift
//  Pokedex
//
//  Created by nicolas.e.manograsso on 15/12/2022.
//

import SwiftUI

struct DataStackView: View {
    private let title: String
    private let values: [String]
    private let detail: String
    
    init(title: String, values: [String]) {
        self.title = title
        self.values = values
        detail = ""
    }
    
    init(title: String, value: String) {
        self.title = title
        self.values = [value]
        detail = ""
    }
    
    init(title: String, value: (String, String)) {
        self.title = title
        self.values = [value.0]
        detail = value.1
    }
    
    var body: some View {
            HStack {
                Text(title)
                    .foregroundColor(.textBlack)
                    .font(.pokemonType)
                    .frame(width: 96, alignment: .leading)
                
                VStack(alignment: .leading) {
                    ForEach(values, id: \.self) {
                        Text($0)
                            .foregroundColor(.textGrey)
                            .font(.description)
                    }
                }
                
                if !detail.isEmpty {
                    Text("(\(detail))")
                        .foregroundColor(.textGrey)
                        .font(.pokemonType)
                }
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.bottom, 16)
    }
}

struct DataStackView_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            DataStackView(title: "Base Friendship", value: "Overgrow")
            DataStackView(title: "Height", value: ("6.9kg", "15.2 lbs"))
        }
    }
}
