//
//  PokemonSelected.swift
//  Camp2024-Pokedex
//
//  Created by Tais Rocha Nogueira on 01/05/24.
//

import Foundation

struct PokemonSelected: Codable {
    var sprites: PokemonSprites
    var weight: Int
    var types: [PokemonType]
}

struct PokemonType: Codable {
    var type: PokemonTypeData
}

struct PokemonTypeData: Codable {
    var name: String
}

struct PokemonSprites: Codable {
    var front_default: String
}

class PokemonSelectedApi {
    func getData(url: String,completion: @escaping (PokemonSelected) -> ()) {
        guard let url = URL(string: url) else {
            return
        }
        URLSession.shared.dataTask(with: url) { (data, response, error)  in
            guard let data = data else { return }
            
            let pokemonSprite = try! JSONDecoder().decode(PokemonSelected.self, from: data)
            
            DispatchQueue.main.async {
                completion(pokemonSprite)
            }
        }.resume()
        
    }
}

