//
//  NetworkClient.swift
//  MVVM+SwiftUI
//
//  Created by Sagar Kalathil on 16/09/26.
//

import Foundation

final class NetworkClient: NetworkClientProtocol {
    private var session: URLSession
    private var decoder: JSONDecoder
    init(session: URLSession, decoder: JSONDecoder) {
        self.session = session
        self.decoder = decoder
    }
    
    func request<T>(_ endPoint: URL) async throws -> T where T : Decodable {
        let (data, response) = try await session.data(from: endPoint)
        guard let httpResponse = response as? HTTPURLResponse, 200..<300 ~= httpResponse.statusCode else {
            throw URLError(.badServerResponse)
        }
        return try decoder.decode(T.self, from: data)
    }
    
}






















/*

final class NetworkClient: NetworkClientProtocol {
    private let session: URLSession
    private let decoder: JSONDecoder
    init(session: URLSession, decoder: JSONDecoder) {
        self.session = session
        self.decoder = decoder
    }
    
    func request<T>(_ endpoint: URL) async throws -> T where T : Decodable {
        let (data, response) = try await session.data(from: endpoint)
        guard let httpResponse = response as? HTTPURLResponse, 200..<300 ~= httpResponse.statusCode else {
            throw URLError(.badServerResponse)
        }
        return try decoder.decode(T.self, from: data)
    }
}*/
