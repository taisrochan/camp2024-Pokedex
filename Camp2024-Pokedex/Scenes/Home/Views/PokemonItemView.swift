//
//  PokemonItemView.swift
//  Camp2024-Pokedex
//
//  Created by Tais Rocha Nogueira on 01/05/24.
//

import SwiftUI

struct PokemonItemView: View {
    var imageLink = ""
    var pokemonName: String
    var pokemonType: PokemonTypesEnum {
        PokemonTypesEnum(fromRawValue: pokemonData?.types.first?.type.name ?? "")
    }
    @State private var pokemonData: PokemonSelected?
    
    var body: some View {
        VStack {
            Rectangle()
                .foregroundColor(.clear)
                .background(
                    RoundedRectangle(cornerRadius: 8)
                        .stroke(pokemonType.color, lineWidth: 1)
                )
                .frame(width: 104, height: 112)
                .overlay(
                    VStack{
                        Spacer()
                        Spacer()
                        AsyncImage(url: URL(string: pokemonData?.sprites.front_default ?? "placeholder"))
                            .frame(width: 75, height: 75)
                            .onAppear {
                                let loadedData = UserDefaults.standard.string(forKey: imageLink)
                                if loadedData == nil {
                                    getSprite(url: imageLink)
                                    UserDefaults.standard.set(imageLink, forKey: imageLink)
                                    print("New url!!! Caching...")
                                } else {
                                    getSprite(url: loadedData!)
                                    print("Using cached url...")
                                }
                            }
                        Spacer()
                        ZStack(alignment: .center) {
                            Rectangle()
                                .foregroundColor(pokemonType.color)
                                .frame(height: 24)
                                .cornerRadius(8)
                            Text(pokemonName.capitalized)
                                .font(.custom("Poppins-Regular", size: 13))
                                .foregroundColor(.black)
                                .padding(8)
                        }
                    }
                )
        }
    }
    
    func getSprite(url: String) {        
        HomeServiceImpl().getData(url: url) { pokemonData in
            self.pokemonData = pokemonData
        }
    }
}

