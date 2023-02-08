//
//  PokemonService.swift
//  Pokedex
//
//  Created by nicolas.e.manograsso on 13/12/2022.
//

import Foundation
import SwiftUI

protocol PokemonServiceProtocol {
    func fetchPokemons() async throws -> [Pokemon]
    func fetchPokemonImage(_ imageUrl: String) async throws -> Image
    func fetchSpecies(_ pokemon: Pokemon) async throws -> PokemonSpecies
}

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

struct PokemonService: PokemonServiceProtocol {
    // MARK: - Static properties
    static let baseURL = "https://pokeapi.co/api/v2/"
    static let manager = NetworkManager(baseURL: baseURL)

    // MARK: - Endpoints
    enum Endpoint: Routable {
        case pokemons([Filters])
        case pokemon(String)
        case species(String)

        var path: String {
            switch self {
            case .pokemons: return "pokemon"
            case .pokemon(let pokemonName): return "pokemon/\(pokemonName)"
            case .species(let pokemonName): return "pokemon-species/\(pokemonName)"
            }
        }

        var queryItems: [URLQueryItem]? {
            switch self {
            case .pokemons(let filters): return filters.map { $0.queryItem() }
            case .pokemon: return nil
            case .species: return nil
            }
        }

        var httpMethod: HttpMethod {
            switch self {
            case .pokemons: return .get
            case .pokemon: return .get
            case .species: return .get
            }
        }
    }

    func fetchPokemons() async throws -> [Pokemon] {
        let manager = PokemonService.manager
        let filters: [Filters] = [.limit(905)]
        let response = try await manager.sendRequest(route: Endpoint.pokemons(filters),
                                                     decodeTo: PokemonResponse.self)
        
        let results = try await fetchPokemons(response.pokemons)
        
        return results
    }

    func fetchPokemonImage(_ url: String) async throws -> Image {
        guard let url = URL(string: url) else {
            throw NetworkManagerError.invalidURL
        }

        let (data, _) = try await URLSession.shared.data(from: url)
        
        guard let uiImage = UIImage(data: data) else {
            throw PokemonServiceError.noImage
        }
        
        return Image(uiImage: uiImage)
    }
    
    func fetchSpecies(_ pokemon: Pokemon) async throws -> PokemonSpecies {
        let manager = PokemonService.manager
        let response = try await manager.sendRequest(route: Endpoint.species(pokemon.name),
                                                     decodeTo: PokemonSpecies.self)
        
        return response
    }
}

private extension PokemonService {
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
        let manager = PokemonService.manager
        let response = try await manager.sendRequest(route: Endpoint.pokemon(name),
                                                     decodeTo: Pokemon.self)
        
        return response
    }
}
