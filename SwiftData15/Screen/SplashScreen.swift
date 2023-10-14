//
//  SplashScreen.swift
//  SwiftData15
//
//  Created by no name on 2023/10/14.
//  
//

import SwiftUI

struct SplashScreen: View {
    
    var onFinish: () -> Void
    
    var body: some View {
        Text("SPLASH")
            .task {
                print("task START")
                do {
                    try await Task.sleep(until: .now + .seconds(3))
                } catch {
                    debugPrint(error)
                }
                print("task END")
                onFinish()
            }
    }
}

#Preview {
    SplashScreen(onFinish: {})
}
