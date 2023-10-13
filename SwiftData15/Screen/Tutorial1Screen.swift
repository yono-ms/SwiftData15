//
//  Tutorial1Screen.swift
//  SwiftData15
//
//  Created by no name on 2023/10/14.
//  
//

import SwiftUI

struct Tutorial1Screen: View {
    
    @Binding var path: [ScreenPath]
    
    var body: some View {
        Tutorial1Content {
            path.append(.tutorial2)
        }
    }
}

struct Tutorial1Content: View {
    var onNext: () -> Void
    var body: some View {
        VStack(spacing: 16) {
            Text("TUTORIAL STEP 1")
            Button("Next") {
                onNext()
            }
        }
    }
}

#Preview {
    Tutorial1Content {}
}
