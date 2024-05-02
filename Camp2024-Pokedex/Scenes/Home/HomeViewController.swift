//
//  HomeViewController.swift
//  Camp2024-Pokedex
//
//  Created by Tais Rocha Nogueira on 01/05/24.
//

import Foundation
import SwiftUI

struct HomeViewController: View {
    @StateObject var viewModel = MyViewModel()
    @State private var searchText = ""
    @State private var isSwitchOn = false
    
    var body: some View {
        ZStack {
            Image("topBar")
                .position(x: UIScreen.main.bounds.width / 2, y: 0)
                .edgesIgnoringSafeArea(.top)
            
            ScrollView {
                VStack(spacing: 20) {
                    HStack {
                        Image("ioasysIcon")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 27, height: 21)
                            .padding(.leading, 16)
                        Text("ioasys pokedéx")
                            .font(.custom("Poppins-Bold", size: 24))
                            .foregroundStyle(Color("ioasys"))
                        Spacer()
                        Toggle("", isOn: $isSwitchOn)
                            .labelsHidden()
                            .scaleEffect(0.7)
                    }
                    
                    .padding()
                    
                    HStack {
                        TextField("Buscar Pokemon", text: $searchText)
                            .font(.custom("Poppins-Regular", size: 19))
                            .padding(8)
                            .background(Color.lightGray.opacity(0.3))
                            .cornerRadius(8)
                        Button(action: {
                        }) {
                            Image(systemName: "heart.fill")
                                .foregroundColor(Color("ioasys"))
                                .font(.system(size: 20))
                        }
                    }
                    .padding()
                    LazyVGrid(
                        columns: Array(
                            repeating: GridItem(.flexible(), spacing: 16),
                            count: 3),
                        spacing: 16) {
                            ForEach(viewModel.items, id: \.id) { item in
                                
                                VStack {
                                    Rectangle()
                                        .foregroundColor(.clear)
                                        .background(
                                            RoundedRectangle(cornerRadius: 8)
                                                .stroke(Color.blue, lineWidth: 1)
                                        )
                                        .frame(width: 104, height: 112)
                                        .overlay(
                                            VStack{
                                                Spacer()
                                                Text("pikaName")
                                                    .font(.custom("Poppins-Regular", size: 13))
                                                    .foregroundColor(.black)
                                                    .padding(.bottom, 4)
                                            }
                                        )
                                    
                                    
//                                    Text(item.title)
//                                        .font(.caption)
//                                        .foregroundColor(.black)
                                }
                            }
                            
                        }
                        .padding()
                }
                .padding()
            }
            .navigationTitle("My Screen")
        }
    }
}

//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        HomeViewController()
//    }
//}


