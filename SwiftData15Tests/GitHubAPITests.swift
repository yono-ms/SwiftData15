//
//  GitHubAPITests.swift
//  SwiftData15
//
//  Created by no name on 2023/10/15.
//  
//

import XCTest

final class GitHubAPITests: XCTestCase {
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testGetUser() async throws {
        let dictionary = try await gitHubGetUserDictionary(user: "google")
        print("----")
        print("\(dictionary)")
        XCTAssertFalse(dictionary.isEmpty)
    }
    
    func testGetUserModel() async throws {
        let apiUser = try await gitHubGetUser(user: "google")
        print("----")
        print("\(apiUser)")
        XCTAssert(apiUser.login == "google")
    }
    
    func testGetRepoModel() async throws {
        let apiRepos = try await gitHubGetRepos(url: "https://api.github.com/users/google/repos")
        print("----")
        print("\(apiRepos)")
        XCTAssertFalse(apiRepos.isEmpty)
    }
}
