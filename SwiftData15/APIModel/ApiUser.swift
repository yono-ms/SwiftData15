//
//  UserModel.swift
//  SwiftData15
//
//  Created by no name on 2023/10/15.
//  
//

import Foundation

struct ApiUser: Codable, Identifiable {
    let id: Int
    let login: String
    let name: String?
    let reposUrl: String
    let publicRepos: Int
    let updatedAt: String
}
