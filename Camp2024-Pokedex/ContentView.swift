//
//  ContentView.swift
//  Camp2024-Pokedex
//
//  Created by Tais Rocha Nogueira on 01/05/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image("ioasysIcon")
                            .resizable()
                            .aspectRatio(contentMode: .fit) 
                            .frame(width: 100, height: 100)
            Text("Hello, world!")
                .font(.custom("Poppins-Regular", size: 16))
                .onAppear {
                    PokeApi().getData() { pokemon in
                        print(pokemon)
                        
                        for pokemon in pokemon {
                            print(pokemon.name)
                        }
                    }
                }
        }
        .padding()
    }
    
}

#Preview {
    ContentView()
}
