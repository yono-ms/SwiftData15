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
    @Query(sort: \History.timestamp, order: .reverse) private var histories: [History]
    @Query() private var users: [User]
    
    var body: some View {
        VStack {
            Text("USER")
            let login = histories.first?.user ?? ""
            Text(login)
            if let user = users.first(where: { e in e.login == login}) {
                HStack {
                    Text(user.login)
                    Spacer()
                    Text(user.name)
                    Spacer()
                    Text(user.publicRepos.description)
                }
                List {
                    ForEach(user.repos) { repo in
                        Text(repo.name)
                    }
                }
            }
        }
    }
}

#Preview {
    UserScreen()
        .modelContainer(for: [History.self, User.self], inMemory: true)
}
