//
//  RedditListClientSpy.swift
//  MVVM+SwiftUI
//
//  Created by Sagar Kalathil on 16/09/26.
//
import Testing
@testable import MVVM_SwiftUI
final class RedditListClientSpy: RedditListClientProtocol {
    
    var posts: [RedditPost] = []
    var error: Error?
    
    func fetchRedditData() async throws -> [RedditPost] {
        if let err = error {
            throw err
        }
        return posts
    }
    
}
