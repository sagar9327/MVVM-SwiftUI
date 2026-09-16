//
//  RedditListDependencies.swift
//  MVVM+SwiftUI
//
//  Created by Sagar Kalathil on 16/09/26.
//

final class RedditListDependencies {
    private let appDependencies: AppDependencies
    init(appDependencies: AppDependencies) {
        self.appDependencies = appDependencies
    }
    func makeViewModel() -> RedditListViewModel {
        let client = RedditListClient(networkClient: appDependencies.networkClient)
        return RedditListViewModel(client: client)
    }
}
