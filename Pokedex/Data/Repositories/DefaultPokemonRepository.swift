//
//  PokemonService.swift
//  Pokedex
//
//  Created by nicolas.e.manograsso on 13/12/2022.
//

import Foundation
import SwiftNetworking
import PokedexDomain

enum PokemonServiceError: Error {
    case noImage
}

enum Filters {
    case offset(Int)
    case limit(Int)
    
    func queryItem() -> URLQueryItem {
        switch self {
        case .offset(let off):
            return URLQueryItem(name: "offset", value: String(off))

        case .limit(let limit):
            return URLQueryItem(name: "limit", value: String(limit))
        }
    }
}

struct DefaultPokemonRepository: PokemonRepository {
    // MARK: - Static properties
    static let baseURL = "https://pokeapi.co/api/v2/"
    static let manager = NetworkManager(baseURL: baseURL)

    func fetchPokemons() async throws -> [Pokemon] {
        let manager = DefaultPokemonRepository.manager
        let filters: [Filters] = [.limit(905)]
        let response = try await manager.sendRequest(route: Endpoint.pokemons(filters),
                                                     decodeTo: PokemonResponse.self)
        
        let results = try await fetchPokemons(response.pokemons)
        
        return results
    }

    func fetchPokemonImage(_ url: String) async throws -> Data {
        guard let url = URL(string: url) else {
            throw NetworkManagerError.invalidURL
        }

        let (data, _) = try await URLSession.shared.data(from: url)
        
        return data
    }
    
    func fetchSpecies(_ identifier: Int) async throws -> PokemonSpecies {
        let manager = DefaultPokemonRepository.manager
        let response = try await manager.sendRequest(route: Endpoint.species("\(identifier)"),
                                                     decodeTo: PokemonSpecies.self)
        
        return response
    }
    
    func getWeaknesses(typeNames: [String]) async throws -> TypeRelation {
        return try await withThrowingTaskGroup(of: TypeRelation.self) { group in
            for name in typeNames {
                group.addTask {
                    let response = try await self.fetchTypes(name)
                    return response.damageRelations
                }
            }
            
            var damageRelations: [TypeRelation] = []
            
            for try await typeOfPokemon in group {
                damageRelations.append(typeOfPokemon)
            }
            
            if damageRelations.count == 1, let typeRelation = damageRelations.first {
                return typeRelation
            }
            
            return mergeTypeRelations(damageRelations)
        }
    }
    
    func fetchEggGroup(_ name: String) async throws -> EggGroup {
        let manager = DefaultPokemonRepository.manager
        let response = try await manager.sendRequest(route: Endpoint.eggGroup(name),
                                                     decodeTo: EggGroup.self)
        
        return response
    }
}

private extension DefaultPokemonRepository {
    func fetchPokemons(_ info: [NameUrl]) async throws -> [Pokemon] {
        try await withThrowingTaskGroup(of: Pokemon.self) { group in
            for pkm in info {
                group.addTask {
                    let pokemon = try await self.fetchPokemonDetail(name: pkm.name)
                    return pokemon
                }
            }
            
            var pokemons: [Pokemon] = []
            
            for try await pkm in group {
                pokemons.append(pkm)
            }
            
            return pokemons
        }
    }
    
    func fetchPokemonDetail(name: String) async throws -> Pokemon {
        let manager = DefaultPokemonRepository.manager
        let response = try await manager.sendRequest(route: Endpoint.pokemon(name),
                                                     decodeTo: Pokemon.self)
        
        return response
    }
    
    func fetchTypes(_ name: String) async throws -> TypeResponse {
        let manager = DefaultPokemonRepository.manager
        let response = try await manager.sendRequest(route: Endpoint.types(name),
                                                     decodeTo: TypeResponse.self)
        
        return response
    }
    
    func mergeTypeRelations(_ typeRelations: [TypeRelation]) -> TypeRelation {
        let partialWeaknessess = typeRelations.flatMap { $0.doubleDamageFrom }
        let partialResistences = typeRelations.flatMap { $0.halfDamageFrom + $0.noDamageFrom }
        
        let halfDamageFrom = typeRelations.flatMap { $0.halfDamageFrom }
        let noDamageFrom = typeRelations.flatMap { $0.noDamageFrom }
        
        let weaknesses = partialWeaknessess.filter { !partialResistences.contains($0) }
        
        let typeRelation = TypeRelation(doubleDamageFrom: weaknesses,
                                        noDamageFrom: noDamageFrom,
                                        halfDamageFrom: halfDamageFrom)
        
        return typeRelation
    }
}
