//
//  ContentView.swift
//  SwiftData15
//
//  Created by no name on 2023/10/14.
//  
//

import SwiftUI
import SwiftData
import Alamofire

struct ContentView: View {
    @Environment(\.modelContext) private var modelContext
    @Query(sort: \History.timestamp, order: .reverse) private var histories: [History]
    @Query() private var users: [User]
    @Query() private var repos: [Repo]
    
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
                        guard let user = histories.first?.user else {
                            return
                        }
                        Task {
                            do {
                                let apiUser = try await gitHubGetUser(user: user)
                                let apiRepos = try await gitHubGetRepos(url: apiUser.reposUrl)
                                updateUserAndRepos(apiUser: apiUser, apiRepos: apiRepos)
                            } catch {
                                print(error)
                            }
                        }
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
    
    private func updateUserAndRepos(apiUser: ApiUser, apiRepos: [ApiRepo]) {
        let user = updateOrInsertUser(apiUser: apiUser)
        apiRepos.forEach { apiRepo in
            guard let repo = repos.first(where: { e in e.id == apiRepo.id }) else {
                let repo = Repo(model: apiRepo)
                modelContext.insert(repo)
                return
            }
            repo.name = apiRepo.name
            repo.updatedAt = apiRepo.updatedAt
            repo.user = user
        }
    }
    
    private func updateOrInsertUser(apiUser: ApiUser) -> User {
        guard let user = users.first(where: { e in e.id == apiUser.id }) else {
            let user = User(model: apiUser)
            modelContext.insert(user)
            return user
        }
        user.login = apiUser.login
        user.name = apiUser.name ?? ""
        user.reposUrl = apiUser.reposUrl
        user.publicRepos = apiUser.publicRepos
        user.updatedAt = apiUser.updatedAt
        return user
    }
}

#Preview {
    ContentView()
        .modelContainer(for: [History.self, User.self, Repo.self], inMemory: true)
}
