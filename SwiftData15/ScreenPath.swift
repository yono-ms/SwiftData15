//
//  ScreenPath.swift
//  SwiftData15
//
//  Created by no name on 2023/10/14.
//  
//

import Foundation

enum ScreenPath: String {
    case splash, home, comm, user, repos, tutorial1, tutorial2
    var title: String {
        switch self {
        case .splash:
            return "SPLASH"
        case .home:
            return "HOME"
        case .comm:
            return "COMM"
        case .user:
            return "USER"
        case .repos:
            return "REPOS"
        case .tutorial1:
            return "TUTORIAL 1"
        case .tutorial2:
            return "TUTORIAL 2"
        }
    }
}
