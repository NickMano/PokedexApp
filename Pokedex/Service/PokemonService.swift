//
//  PokemonService.swift
//  Pokedex
//
//  Created by nicolas.e.manograsso on 13/12/2022.
//

import Foundation
import SwiftUI

protocol PokemonServiceProtocol {
    func fetchAll() async throws -> [Pokemon]
    func fetchPokemonImage(_ pokemon: Pokemon) async throws -> Image
}

enum PokemonServiceError: Error {
    case noImage
}

struct PokemonService: PokemonServiceProtocol {
    // MARK: - Static properties
    static let baseURL = "https://pokeapi.co/api/v2/"
    static let manager = NetworkManager(baseURL: baseURL)

    // MARK: - Endpoints
    enum Endpoint: Routable {
        case base
        case detail(pokemonName: String)

        var path: String {
            switch self {
            case .base: return "pokemon"
            case .detail(let pokemonName): return "pokemon/\(pokemonName)"
            }
        }

        var queryItems: [URLQueryItem]? {
            switch self {
            case .base: return nil
            case .detail: return nil
            }
        }

        var httpMethod: HttpMethod {
            switch self {
            case .base: return .get
            case .detail: return .get
            }
        }
    }

    func fetchAll() async throws -> [Pokemon] {
        let manager = PokemonService.manager
        let response = try await manager.sendRequest(route: Endpoint.base, decodeTo: PokemonResponse.self)
        
        var results = try await fetchPokemons(response.pokemons)
        results = results.sorted { $0.id < $1.id }
        
        return results
    }

    func fetchPokemonImage(_ pokemon: Pokemon) async throws -> Image {
        let imageURL = pokemon.imageUrl
        
        guard let url = URL(string: imageURL) else {
            throw NetworkManagerError.invalidURL
        }

        let (data, _) = try await URLSession.shared.data(from: url)
        
        guard let uiImage = UIImage(data: data) else {
            throw PokemonServiceError.noImage
        }
        
        return Image(uiImage: uiImage)
    }
}

private extension PokemonService {
    func fetchPokemons(_ info: [PokemonInfo]) async throws -> [Pokemon] {
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
        let response = try await manager.sendRequest(route: Endpoint.detail(pokemonName: name), decodeTo: Pokemon.self)
        
        return response
    }
}
