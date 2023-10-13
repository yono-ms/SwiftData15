//
//  ContentView.swift
//  SwiftData15
//
//  Created by no name on 2023/10/14.
//  
//

import SwiftUI
import SwiftData

struct ContentView: View {

    @State private var path: [ScreenPath] = [.splash]

    var body: some View {
        NavigationStack(path: $path) {
            VStack(spacing: 16) {
                Text("loading...")
            }
            .navigationDestination(for: ScreenPath.self) { screen in
                switch screen {
                case .splash:
                    SplashScreen(path: $path)
                        .navigationBarBackButtonHidden()
                case .home:
                    HomeScreen()
                        .navigationBarBackButtonHidden()
                case .comm:
                    SampleItemScreen()
                case .user:
                    SampleItemScreen()
                case .repos:
                    SampleItemScreen()
                case .tutorial1:
                    Tutorial1Screen(path: $path)
                        .navigationBarBackButtonHidden()
                case .tutorial2:
                    Tutorial2Screen(path: $path)
                }
            }
            .onAppear {
                print("ContentView onAppear")
            }
            .onDisappear {
                print("ContentView onDisappear")
            }
        }
    }
}

#Preview {
    ContentView()
}
