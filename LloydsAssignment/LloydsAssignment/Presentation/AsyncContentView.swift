//
//  AsyncContentView.swift
//  LloydsAssignment
//
//  Created by BP Maurya on 16/02/25.
//

import SwiftUI

struct AsyncContentView<Source: LoadableObject, Content: View>: View {
    @ObservedObject var source: Source
    var content: (Source.Output) -> Content

    init(source: Source,
             @ViewBuilder content: @escaping (Source.Output) -> Content) {
            self.source = source
            self.content = content
        }
    
    var body: some View {
        switch source.state {
        case .idle:
            Color.clear.onAppear(perform: source.load)
        case .loading:
            ProgressView()
        case .failed(let error):
            ErrorView(error: error, retryHandler: source.load)
        case .loaded(let output):
            content(output)
        }
    }
}
