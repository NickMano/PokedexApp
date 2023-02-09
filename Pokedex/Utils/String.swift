//
//  String.swift
//  Pokedex
//
//  Created by nicolas.e.manograsso on 09/02/2023.
//

extension String {
    var replaceDashWithSpace: String {
        self.replacingOccurrences(of: "-", with: " ")
    }
}
