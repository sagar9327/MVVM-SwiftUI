//
//  RedditListClientProtocol.swift
//  MVVM+SwiftUI
//
//  Created by Sagar Kalathil on 16/09/26.
//
protocol RedditListClientProtocol {
    func fetchRedditData() async throws -> [RedditPost]
}
