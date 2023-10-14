//
//  HomeScreen.swift
//  SwiftData15
//
//  Created by no name on 2023/10/14.
//  
//

import SwiftUI

struct HomeScreen: View {

    var onClick: (ScreenPath) -> Void
    
    var body: some View {
        VStack(spacing: 16) {
            Text("HOME")
            Button("COMM") {
                onClick(.comm)
            }
            Button("goto Sample") {
                onClick(.sample)
            }
            Spacer()
        }
    }
}

#Preview {
    HomeScreen(onClick: {_ in })
}
