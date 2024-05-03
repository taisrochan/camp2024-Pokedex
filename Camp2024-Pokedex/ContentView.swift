//
//  ContentView.swift
//  Camp2024-Pokedex
//
//  Created by Tais Rocha Nogueira on 02/05/24.
//

import SwiftUI

struct ContentView: View {
    @State private var showSplash = true
    
    var body: some View {
        ZStack {
            if showSplash {
                SplashScreenView()
                    .transition(.opacity)
            } else {
                let service = HomeServiceImpl()
                let viewModel = HomeViewModelImpl(client: service)
                HomeViewController<HomeViewModelImpl>(viewModel: viewModel)
            }
        }
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                withAnimation {
                    self.showSplash = false
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
