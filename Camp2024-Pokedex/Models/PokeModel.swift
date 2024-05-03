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


