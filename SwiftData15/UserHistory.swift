//
//  User.swift
//  SwiftData15
//
//  Created by no name on 2023/10/14.
//  
//

import Foundation
import SwiftData

@Model
final class UserHistory {
    var user: String
    var timestamp: Date
    
    init(user: String, timestamp: Date) {
        self.user = user
        self.timestamp = timestamp
    }
}
