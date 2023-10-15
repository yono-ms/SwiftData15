//
//  UserEntity.swift
//  SwiftData15
//
//  Created by no name on 2023/10/15.
//  
//

import Foundation
import SwiftData

@Model
final class User {
    @Attribute(.unique) var id: Int
    var login: String
    var name: String
    @Attribute(originalName: "repos_url") var reposUrl: String
    @Attribute(originalName: "public_repos") var publicRepos: Int
    @Attribute(originalName: "updated_at") var updatedAt: String
    @Relationship(deleteRule: .cascade, inverse: \Repo.user)
    var repos = [Repo]()
    
    init(model: ApiUser) {
        self.id = model.id
        self.login = model.login
        self.name = model.name ?? ""
        self.reposUrl = model.reposUrl
        self.publicRepos = model.publicRepos
        self.updatedAt = model.updatedAt
    }
}
