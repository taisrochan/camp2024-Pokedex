//
//  PokeColors.swift
//  Camp2024-Pokedex
//
//  Created by Tais Rocha Nogueira on 01/05/24.
//

import Foundation
import SwiftUI

enum PokemonTypesEnum: String {
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
    
    init(fromRawValue: String) {
        self = PokemonTypesEnum(rawValue: fromRawValue) ?? .rock
    }
    
    var color: Color {
        switch self {
            case .rock: Color(hex:"#B69E31")
            case .ghost: Color(hex:"#70559B")
            case .steel: Color(hex: "#B7B9D0")
            case .water: Color(hex: "#6493EB")
            case .grass: Color(hex:"#74CB48")
            case .psychic: Color(hex: "#FB5584")
            case .ice: Color(hex: "#9AD6DF")
            case .dark: Color(hex: "#75574C")
            case .fairy: Color(hex: "#E69EAC")
            case .normal: Color(hex: "#AAA67F")
            case .fighting: Color(hex: "#C12239")
            case .flying: Color(hex: "#A891EC")
            case .poison: Color(hex: "#A43E9E")
            case .ground: Color(hex: "#DEC16B")
            case .bug: Color(hex: "#A7B723")
            case .fire: Color(hex: "#F57D31")
            case .electric: Color(hex: "#F9CF30")
            case .dragon: Color(hex: "#7037FF")
        }
    }
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

