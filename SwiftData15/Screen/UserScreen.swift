//
//  UserScreen.swift
//  SwiftData15
//
//  Created by no name on 2023/10/14.
//  
//

import SwiftUI
import SwiftData

struct UserScreen: View {
    @Environment(\.modelContext) private var modelContext
    @Query(sort: \UserHistory.timestamp, order: .reverse) private var histories: [UserHistory]
    
    var body: some View {
        Text("USER")
    }
}

#Preview {
    UserScreen()
        .modelContainer(for: UserHistory.self, inMemory: true)
}
