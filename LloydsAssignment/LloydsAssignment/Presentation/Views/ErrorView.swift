//
//  ErrorView.swift
//  LloydsAssignment
//
//  Created by BP Maurya on 16/02/25.
//

import SwiftUI

struct ErrorView: View {
    let error: Error
    let retryHandler: () -> Void

    var body: some View {
        VStack(spacing: 20) {
            Text("Something went wrong.")
                .font(.title)
                .foregroundColor(.red)

            Text(error.localizedDescription)
                .font(.body)
                .foregroundColor(.gray)
                .padding()

            Button(action: {
                retryHandler()  // Trigger retry handler when button is pressed
            }) {
                Text("Retry")
                    .font(.headline)
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
            .padding()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.white.opacity(0.8))
        .cornerRadius(10)
        .shadow(radius: 10)
        .padding()
    }
}
