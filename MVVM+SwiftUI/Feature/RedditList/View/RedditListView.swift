//
//  RedditListView.swift
//  MVVM+SwiftUI
//
//  Created by Sagar Kalathil on 16/09/26.
//
import SwiftUI
struct RedditListView: View {
    @StateObject private var vm: RedditListViewModel
    init(vm: RedditListViewModel) {
        _vm = StateObject(wrappedValue: vm)
    }
    var body: some View {
        Group {
            if vm.isLoading {
                LoadingView()
            } else if !vm.arrPost.isEmpty {
                NavigationStack {
                    VStack {
                        List(vm.arrPost, id: \.id) { post in
                            RedditPostRow(post: post)
                        }.listStyle(PlainListStyle())
                    }
                    .navigationTitle("Reddit List")
                }
            } else if vm.errorMessage != nil {
                ErrorView(errorMessage: vm.errorMessage ?? "")
            }
        }
        .task {
            await vm.fetchRedditList()
        }
        
    }
}
