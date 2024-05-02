//
//  PokeModel.swift
//  Camp2024-Pokedex
//
//  Created by Tais Rocha Nogueira on 01/05/24.
//

import Foundation
import SwiftUI

struct Pokemon: Codable {
    var results: [PokemonResponse]
}

struct PokemonResponse: Codable {
    var name: String
    var url: String
}

struct PokemonEntry: Codable, Identifiable {
    var id = UUID()
    var name: String
    var url: String
}

//class PokeApi {
//    func getData(completion: @escaping ([PokemonResponse]) -> ()) {
//        guard let url = URL(string: "https://pokeapi.co/api/v2/pokemon/?offset=0&limit=151") else {
//            return
//        }
//        URLSession.shared.dataTask(with: url) { (data, response, error)  in
//            guard let data = data else { return }
//            
//            let pokemonList = try! JSONDecoder().decode(Pokemon.self, from: data)
//            
//            DispatchQueue.main.async {
//                completion(pokemonList.results)
//            }
//        }.resume()
//        
//    }
//}

