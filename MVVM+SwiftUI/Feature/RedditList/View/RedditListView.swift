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
                List(vm.arrPost, id: \.id) { post in
                    NavigationLink {
                        RedditUserDetail(post: post)
                    } label: {
                        RedditPostRow(post: post)
                    }
                }
                .listStyle(.plain)
            } else if let errorMessage = vm.errorMessage {
                ErrorView(
                    errorMessage: errorMessage
                )
            } else {

                Text("No posts found")
            }
        }
        .navigationTitle("Reddit List")
        .task {
            await vm.fetchRedditList()
        }
    }
}
