//
//  HomeService.swift
//  Camp2024-Pokedex
//
//  Created by Tais Rocha Nogueira on 01/05/24.
//

import Foundation

protocol HomeService {
    func fetchPokemon(completion: @escaping (Result<Pokemon, Error>) -> Void)
    func getData(url: String,completion: @escaping (PokemonSelected) -> ())
}

class HomeServiceImpl: HomeService {
    func fetchPokemon(completion: @escaping (Result<Pokemon, Error>) -> Void) {
        guard let url = URL(string: "https://pokeapi.co/api/v2/pokemon/?offset=0&limit=151") else {
            completion(.failure(NSError(domain: "Invalid URL", code: 0, userInfo: nil)))
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                completion(.failure(error))
                return
            }
            
            guard let data = data else {
                completion(.failure(NSError(domain: "No data received", code: 0, userInfo: nil)))
                return
            }
            
            do {
                let decoder = JSONDecoder()
                let pokemon = try decoder.decode(Pokemon.self, from: data)
                completion(.success(pokemon))
            } catch {
                completion(.failure(error))
            }
        }.resume()
    }
    
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
