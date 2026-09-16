//
//  RedditListViewModel.swift
//  MVVM+SwiftUI
//
//  Created by Sagar Kalathil on 16/09/26.
//
import Combine
final class RedditListViewModel: ObservableObject {
    @Published var arrPost: [RedditPost] = []
    @Published var isLoading = false
    @Published var errorMessage: String?
    
    private let client: RedditListClientProtocol
    
    init(client: RedditListClientProtocol) {
        self.client = client
    }
    
    @MainActor
    func fetchRedditList() async {
        isLoading = true
        defer {
            isLoading = false
        }
        do {
            arrPost = try await client.fetchRedditData()
        } catch {
            errorMessage = error.localizedDescription
        }
    }
}
