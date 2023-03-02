//
//  TextExtension.swift
//  Pokedex
//
//  Created by nicolas.e.manograsso on 24/02/2023.
//

import SwiftUI

extension Text {
    func sectionTitle(color: Color?) -> some View {
        self
            .foregroundColor(color)
            .font(.filterTitle)
            .padding(.bottom, 4)
    }
}
