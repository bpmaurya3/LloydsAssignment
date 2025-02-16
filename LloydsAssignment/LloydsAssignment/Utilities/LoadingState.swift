//
//  LoadingState.swift
//  LloydsAssignment
//
//  Created by BP Maurya on 16/02/25.
//

import SwiftUI

enum LoadingState<Value> {
    case idle
    case loading
    case failed(Error)
    case loaded(Value)
}

protocol LoadableObject: ObservableObject {
    associatedtype Output
    var state: LoadingState<Output> { get }
    func load()
}
