//
//  PokemonInfosModels.swift
//  Camp2024-Pokedex
//
//  Created by Tais Rocha Nogueira on 03/05/24.
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
