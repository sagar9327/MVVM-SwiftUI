//
//  NetworkClient.swift
//  MVVM+SwiftUI
//
//  Created by Sagar Kalathil on 16/09/26.
//
import Foundation

protocol NetworkClientProtocol {
    func request<T: Decodable>(_ endPoint: URL) async throws -> T
}

