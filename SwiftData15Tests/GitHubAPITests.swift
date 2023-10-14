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
        let dictionary = try await gitHubGetUser(user: "google")
        print("----")
        print("\(dictionary)")
        XCTAssertFalse(dictionary.isEmpty)
    }
    
    func testGetUserModel() async throws {
        let model = try await gitHubGetUserModel(user: "google")
        print("----")
        print("\(model)")
        XCTAssert(model.login == "google")
    }
}
