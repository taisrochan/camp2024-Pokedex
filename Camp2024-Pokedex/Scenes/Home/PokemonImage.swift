//
//  PokemonImage.swift
//  Camp2024-Pokedex
//
//  Created by Tais Rocha Nogueira on 01/05/24.
//

import SwiftUI

struct PokemonImage: View {
    var imageLink = ""
    @State private var pokemonSprite = ""
    
    var body: some View {
        AsyncImage(url: URL(string: pokemonSprite))
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
    }
    
    func getSprite(url: String) {
        var tempSprite: String?
        
        PokemonSelectedApi().getData(url: url) { sprite in
//            tempSprite = sprite.front_default
//            self.pokemonSprite = tempSprite ?? "placeholder"
            
        }
    }
}

//struct PokemonImage_Previews: PreviewProvider {
//    static var previews: some View {
//        PokemonImage()
//    }
//}
