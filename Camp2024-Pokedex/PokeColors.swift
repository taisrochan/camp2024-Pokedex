//
//  PokeColors.swift
//  Camp2024-Pokedex
//
//  Created by Tais Rocha Nogueira on 01/05/24.
//

import Foundation
import SwiftUI

enum PokemonType: String {
    case rock
    case ghost
    case steel
    case water
    case grass
    case psychic
    case ice
    case dark
    case fairy
    case normal
    case fighting
    case flying
    case poison
    case ground
    case bug
    case fire
    case electric
    case dragon
}

struct PokemonColors {
    static let colors: [PokemonType: Color] = [
        .rock: Color(hex:"#B69E31"),
        .ghost: Color(hex:"#70559B"),
        .steel: Color(hex: "#B7B9D0"),
        .water: Color(hex: "#6493EB"),
        .grass: Color(hex:"#74CB48"),
        .psychic: Color(hex: "#FB5584"),
        .ice: Color(hex: "#9AD6DF"),
        .dark: Color(hex: "#75574C"),
        .fairy: Color(hex: "#E69EAC"),
        .normal: Color(hex: "#AAA67F"),
        .fighting: Color(hex: "#C12239"),
        .flying: Color(hex: "#A891EC"),
        .poison: Color(hex: "#A43E9E"),
        .ground: Color(hex: "#DEC16B"),
        .bug: Color(hex: "#A7B723"),
        .fire: Color(hex: "#F57D31"),
        .electric: Color(hex: "#F9CF30"),
        .dragon: Color(hex: "#7037FF")
    ]
}

extension Color {
    init(hex: String) {
        var hexString = hex.trimmingCharacters(in: .whitespacesAndNewlines)
        if hexString.hasPrefix("#") {
            hexString.remove(at: hexString.startIndex)
        }

        var rgb: UInt64 = 0
        Scanner(string: hexString).scanHexInt64(&rgb)

        let red = Double((rgb & 0xFF0000) >> 16) / 255.0
        let green = Double((rgb & 0x00FF00) >> 8) / 255.0
        let blue = Double(rgb & 0x0000FF) / 255.0

        self.init(red: red, green: green, blue: blue)
    }
}

