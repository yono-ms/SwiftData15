//
//  Tutorial1Screen.swift
//  SwiftData15
//
//  Created by no name on 2023/10/14.
//  
//

import SwiftUI

struct Tutorial1Screen: View {
    
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
    Tutorial1Screen {}
}
