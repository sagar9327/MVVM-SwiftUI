//
//  Post.swift
//  MVVM+SwiftUI
//
//  Created by Sagar Kalathil on 16/09/26.
//

struct RedditPost: Decodable, Identifiable {
    var userId: Int
    var id: Int
    var title: String
    var body: String
}
