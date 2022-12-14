//
//  HomeViewModel.swift
//  Pokedex
//
//  Created by nicolas.e.manograsso on 13/12/2022.
//

import SwiftUI

protocol HomeViewModelProtocol: ObservableObject {
    var pokemons: [Pokemon] { get }
    var isFetching: Bool { get }
    
    func fetchPokemons()
    func getImageById(_ identifier: Int) -> Image?
    func loadMoreContentIfNeeded(currentItem: Int)
}

class HomeViewModel: HomeViewModelProtocol {
    // MARK: - Properties
    @Published private(set) var isFetching = true
    
    @Published private(set) var pokemons: [Pokemon] = []
    private(set) var images: [Int: Image] = [:]
    
    private let service: PokemonServiceProtocol
    
    // MARK: - Initializers
    init(service: PokemonServiceProtocol = PokemonService()) {
        self.service = service
    }
    
    // MARK: - Public methods
    @MainActor
    func fetchPokemons() {
        isFetching = true
        
        Task {
            do {
                pokemons = try await service.fetchAll()
                await fetchImages()
                
                isFetching = false
            } catch {}
        }
    }
    
    func loadMoreContentIfNeeded(currentItem: Int) {
    }
    
    func getImageById(_ identifier: Int) -> Image? {
        images[identifier]
    }
}

// MARK: - Private methods
private extension HomeViewModel {
    @MainActor
    func fetchImages() async {
        do {
            for pokemon in pokemons {
                let image = try await fetchImageById(pokemon.id)
                images[pokemon.id] = image
            }
        } catch { }
    }
    
    func fetchImageById(_ identifier: Int) async throws -> Image {
        guard let pokemon = pokemons.first(where: { $0.id == identifier }),
              let image = try? await service.fetchPokemonImage(pokemon) else {
            return Image("")
        }
        
        return image
    }
}
