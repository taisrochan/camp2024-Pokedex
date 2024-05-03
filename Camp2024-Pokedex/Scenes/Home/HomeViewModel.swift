//
//  HomeViewModel.swift
//  Camp2024-Pokedex
//
//  Created by Tais Rocha Nogueira on 01/05/24.
//

import Foundation
import SwiftUI

protocol HomeViewModel: ObservableObject {
    var items: [PokemonEntry] { get set }
    func fetchPokemon()
}

class HomeViewModelImpl: HomeViewModel {
    @Published var items: [PokemonEntry] = []
    private let client: HomeService
    
    init(client: HomeService) {
        self.client = client
    }
    
    func fetchPokemon() {
        client.fetchPokemon { result in
            switch result {
            case .success(let pokemon):
                DispatchQueue.main.async {
                    self.items = pokemon.results.map({
                        PokemonEntry(name: $0.name, url: $0.url)
                    })
                }
            case .failure(let error):
                print("Failed to fetch Pokemon: \(error)")
            }
        }
    }
}
