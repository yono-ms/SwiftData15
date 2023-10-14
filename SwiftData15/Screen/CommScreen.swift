//
//  CommScreen.swift
//  SwiftData15
//
//  Created by no name on 2023/10/14.
//  
//

import SwiftUI
import SwiftData

struct CommScreen: View {
    @Environment(\.modelContext) private var modelContext
    @Query(sort: \UserHistory.timestamp, order: .reverse) private var histories: [UserHistory]
    
    var onGet: () -> Void
    
    @State private var user = ""
    
    var body: some View {
        VStack(spacing: 16) {
            TextField("user", text: $user)
                .textFieldStyle(.roundedBorder)
                .keyboardType(.asciiCapable)
                .textInputAutocapitalization(.never)
                .padding()
            Button("GET") {
                if (user.isEmpty) {
                    return
                }
                updateHistory(user)
                onGet()
            }
            List {
                ForEach(histories) { history in
                    HStack {
                        Text(history.user)
                        Spacer()
                    }
                    .contentShape(Rectangle())
                    .onTapGesture {
                        user = history.user
                    }
                }
            }
        }
    }
    
    private func updateHistory(_ user: String) {
        if let history = histories.first(where: { element in element.user == user}) {
            history.timestamp = Date()
            do {
                try modelContext.save()
            } catch {
                debugPrint(error)
            }
        } else {
            let history = UserHistory(user: user, timestamp: Date())
            modelContext.insert(history)
        }
    }
}

#Preview {
    CommScreen(onGet: {})
        .modelContainer(for: UserHistory.self, inMemory: true)
}
