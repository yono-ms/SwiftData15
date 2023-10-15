//
//  GitHubAPI.swift
//  SwiftData15
//
//  Created by no name on 2023/10/15.
//  
//

import Foundation
import Alamofire

func gitHubGetUserDictionary(user: String) async throws -> [String : Any] {
    let response = await AF.request("https://api.github.com/users/\(user)")
        .validate(statusCode: 200 ..< 300)
        .serializingData()
        .response
    debugPrint(response)
    switch response.result {
    case .success(let data):
        print("gitHubGetUser success")
        let dictionary = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any] ?? [:]
        return dictionary
    case .failure(let error):
        print("gitHubGetUser failure")
        throw error
    }
}

func gitHubGetUser(user: String) async throws -> ApiUser {
    let decoder = JSONDecoder()
    decoder.keyDecodingStrategy = .convertFromSnakeCase
    let response = await AF.request("https://api.github.com/users/\(user)")
        .validate(statusCode: 200 ..< 300)
        .serializingDecodable(ApiUser.self, decoder: decoder)
        .response
    debugPrint(response)
    switch response.result {
    case .success(let data):
        print("gitHubGetUserModel success")
        return data
    case .failure(let error):
        print("gitHubGetUserModel failure")
        throw error
    }
}

func gitHubGetRepos(url: String) async throws -> [ApiRepo] {
    let decoder = JSONDecoder()
    decoder.keyDecodingStrategy = .convertFromSnakeCase
    let response = await AF.request(url)
        .validate(statusCode: 200 ..< 300)
        .serializingDecodable(Array<ApiRepo>.self, decoder: decoder)
        .response
    debugPrint(response)
    switch response.result {
    case .success(let data):
        print("gitHubGetRepoModel success")
        return data
    case .failure(let error):
        print("gitHubGetRepoModel failure")
        throw error
    }
}
