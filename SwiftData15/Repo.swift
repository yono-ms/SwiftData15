//
//  RepoEntity.swift
//  SwiftData15
//
//  Created by no name on 2023/10/15.
//  
//

import Foundation
import SwiftData

@Model
final class Repo {
    @Attribute(.unique) var id: Int
    var name: String
    @Attribute(originalName: "updated_at") var updatedAt: String
    var user: User?
    
    init(model: ApiRepo) {
        self.id = model.id
        self.name = model.name
        self.updatedAt = model.updatedAt
    }
}
