//
//  RouterScreenProtocol.swift
//  Pokedex
//
//  Created by nicolas.e.manograsso on 01/02/2023.
//

protocol RouterScreenProtocol: RouterNavigationViewScreenProtocol & RouterNavigationStackScreenProtocol & RouterSheetScreenProtocol {
    var routeType: RouterScreenPresentationType { get }
}

enum RouterScreenPresentationType {
    case sheet
    case fullScreenCover
    case navigationLink

    // To make it work, you have to use NavigationStack
    case navigationDestination
}
