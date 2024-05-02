//
//  HomeViewModel.swift
//  Camp2024-Pokedex
//
//  Created by Tais Rocha Nogueira on 01/05/24.
//

import Foundation
import SwiftUI

class MyViewModel: ObservableObject {
    @Published var items: [Item] = []
    @Published var pokemon: Pokemon?
        private let client = PokemonAPIClient()

    
    func fetchPokemon() {
           client.fetchPokemon { result in
               switch result {
               case .success(let pokemon):
                   self.pokemon = pokemon
               case .failure(let error):
                   print("Failed to fetch Pokemon: \(error)")
               }
           }
       }
    
    init() {
        items = [
            Item(id: UUID(), title: ""),
            Item(id: UUID(), title: ""),
            Item(id: UUID(), title: ""),
            Item(id: UUID(), title: ""),
            Item(id: UUID(), title: ""),
            Item(id: UUID(), title: ""),
            Item(id: UUID(), title: ""),
            Item(id: UUID(), title: ""),
            Item(id: UUID(), title: ""),
            Item(id: UUID(), title: ""),
            Item(id: UUID(), title: ""),
            Item(id: UUID(), title: "")
        ]
    }
}

struct Item: Identifiable {
    let id: UUID
    let title: String
}
