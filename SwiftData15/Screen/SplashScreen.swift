//
//  SplashScreen.swift
//  SwiftData15
//
//  Created by no name on 2023/10/14.
//  
//

import SwiftUI

struct SplashScreen: View {
    
    @Binding var path: [ScreenPath]
    
    var body: some View {
        SplashContent()
            .task {
                print("task START")
                do {
                    try await Task.sleep(until: .now + .seconds(3))
                } catch {
                    debugPrint(error)
                }
                path.removeAll()
                path.append(.tutorial1)
                print("task END")
            }
    }
}

struct SplashContent: View {
    var body: some View {
        Text("SPLASH")
    }
}

#Preview {
    SplashContent()
}
