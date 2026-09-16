//
//  RedditPost.swift
//  MVVM+SwiftUI
//
//  Created by Sagar Kalathil on 16/09/26.
//
import SwiftUI
struct RedditPostRow: View {
    var post: RedditPost
    var body: some View {
        VStack(alignment: .leading) {
            Text(post.title)
                .foregroundStyle(Color.red)
                .font(.headline)
                .bold()
            Text(post.body)
                .foregroundStyle(Color.black)
                .font(.title2)
        }
    }
}
