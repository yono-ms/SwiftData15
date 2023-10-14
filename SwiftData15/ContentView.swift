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
    
    @AppStorage("Tutorial") var tutorial = true

    @State private var path: [ScreenPath] = [.splash]

    var body: some View {
        NavigationStack(path: $path) {
            VStack(spacing: 16) {
                Text("loading...")
            }
            .navigationDestination(for: ScreenPath.self) { screen in
                switch screen {
                case .splash:
                    SplashScreen {
                        path.removeAll()
                        if (tutorial) {
                            path.append(.tutorial1)
                        } else {
                            path.append(.home)
                        }
                    }
                    .navigationBarBackButtonHidden()
                case .home:
                    HomeScreen { screen in
                        path.append(screen)
                    }
                    .navigationBarBackButtonHidden()
                case .comm:
                    CommScreen {
                        path.append(.user)
                    }
                case .user:
                    UserScreen()
                case .repos:
                    SampleItemScreen()
                case .tutorial1:
                    Tutorial1Screen {
                        path.append(.tutorial2)
                    }
                    .navigationBarBackButtonHidden()
                case .tutorial2:
                    Tutorial2Screen {
                        tutorial = false
                        path.removeAll()
                        path.append(.home)
                    }
                case .sample:
                    SampleItemScreen()
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
