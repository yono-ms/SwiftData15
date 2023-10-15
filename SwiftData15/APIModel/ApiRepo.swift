//
//  RepoModel.swift
//  SwiftData15
//
//  Created by no name on 2023/10/15.
//  
//

import Foundation

struct ApiRepo: Codable, Identifiable {
    let id: Int
    let name: String
    let updatedAt: String
}
