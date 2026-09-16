//
//  LoadingView.swift
//  MVVM+SwiftUI
//
//  Created by Sagar Kalathil on 16/09/26.
//
import SwiftUI
struct ErrorView: View {
    var errorMessage: String
    var body: some View {
        VStack {
            Text("Error: \(errorMessage)")
        }
    }
}
