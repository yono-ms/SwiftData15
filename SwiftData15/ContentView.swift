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

    @State private var path: [ScreenPath] = []

    var body: some View {
        NavigationStack(path: $path) {
            VStack(spacing: 16) {
                Text("loading...")
                Button("goto splash") {
                    path.append(.splash)
                }
                Button("goto tutorial") {
                    path.append(.tutorial1)
                }
            }
            .navigationDestination(for: ScreenPath.self) { screen in
                switch screen {
                case .splash:
                    SampleItemScreen()
                case .home:
                    HomeScreen()
                        .navigationTitle(screen.title)
                        .navigationBarBackButtonHidden()
                case .comm:
                    SampleItemScreen()
                case .user:
                    SampleItemScreen()
                case .repos:
                    SampleItemScreen()
                case .tutorial1:
                    Tutorial1Screen(path: $path)
                        .navigationTitle(screen.title)
                        .navigationBarBackButtonHidden()
                case .tutorial2:
                    Tutorial2Screen(path: $path)
                        .navigationTitle(screen.title)
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
