//
//  ImageCache.swift
//  LloydsAssignment
//
//  Created by BP Maurya on 14/02/25.
//

import SwiftUI

actor ImageCache {
    private var cache = NSCache<NSString, UIImage>()

    // Download and cache image
    func loadImage(from url: URL) async throws -> UIImage? {
        // Check cache first
        if let cachedImage = cache.object(forKey: url.absoluteString as NSString) {
            return cachedImage
        }

        // Download image if not cached
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            if let image = UIImage(data: data) {
                cache.setObject(image, forKey: url.absoluteString as NSString)
                return image
            }
        } catch {
            throw APIServiceError.downloadingError(error.localizedDescription)
        }

        return nil
    }
}

