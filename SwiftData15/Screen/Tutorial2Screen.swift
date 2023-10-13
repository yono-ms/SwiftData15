//
//  Tutorial2Screen.swift
//  SwiftData15
//
//  Created by no name on 2023/10/14.
//  
//

import SwiftUI

struct Tutorial2Screen: View {
    
    @Binding var path: [ScreenPath]
    
    var body: some View {
        Tutorial2Content {
            path.removeAll()
            path.append(.home)
        }
    }
}

struct Tutorial2Content: View {
    var onFinish: () -> Void
    var body: some View {
        VStack(spacing: 16) {
            Text("tutorial step 2")
            Button("Finish") {
                onFinish()
            }
        }
    }
}

#Preview {
    Tutorial2Content {}
}
