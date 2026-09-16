//
//  MVVM_SwiftUIApp.swift
//  MVVM+SwiftUI
//
//  Created by Sagar Kalathil on 16/09/26.
//

import SwiftUI
@main
struct MVVM_SwiftUIApp: App {
    private let appDependencies = AppDependencies()
    var body: some Scene {
        WindowGroup {
            RedditListView(vm: RedditListDependencies(appDependencies: appDependencies).makeViewModel())
        }
    }
}
