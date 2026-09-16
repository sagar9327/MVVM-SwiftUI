//
//  Untitled.swift
//  MVVM+SwiftUI
//
//  Created by Sagar Kalathil on 16/09/26.
//

import Foundation
final class AppDependencies {
    let networkClient: NetworkClientProtocol

    init() {
        let networkClient = NetworkClient(session: URLSession.shared, decoder: JSONDecoder())
        self.networkClient = networkClient
    }
}
