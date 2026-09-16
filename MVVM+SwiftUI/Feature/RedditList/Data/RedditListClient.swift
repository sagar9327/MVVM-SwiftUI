//
//  Untitled.swift
//  MVVM+SwiftUI
//
//  Created by Sagar Kalathil on 16/09/26.
//

import Foundation


enum NetworkError: Error {
    case invalidURL
}

final class RedditListClient: RedditListClientProtocol {
    private let networkClient: NetworkClientProtocol
    
    init(networkClient: NetworkClientProtocol) {
        self.networkClient = networkClient
    }
    
    func fetchRedditData() async throws -> [RedditPost] {
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/posts") else {
            throw NetworkError.invalidURL
        }
        let response: [RedditPost] = try await networkClient.request(url)
        return response
    }
}
