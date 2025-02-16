//
//  CacheAsyncImage.swift
//  LloydsAssignment
//
//  Created by BP Maurya on 14/02/25.
//

import SwiftUI


struct CacheAsyncImage<ShapeType: Shape>: View {
    @State private var image: UIImage? = nil
    @State private var isLoading = true // Track loading state
    @State private var imageCache = ImageCache() // Local instance of ImageCache
    let url: URL
    let placeholder: Image
    let shape: ShapeType  // Accept any Shape
    
    var body: some View {
        GeometryReader { geometry in
            Group {
                if isLoading {
                    // Show ProgressView while loading the image
                    ProgressView()
                        .progressViewStyle(CircularProgressViewStyle())
                        .frame(width: 50, height: 50, alignment: .center)
                        .padding(geometry.size.width / 2 - 25)
                } else if let image = image {
                    // Show image once it is downloaded
                    Image(uiImage: image)
                        .resizable()  // Make the image resizable
                        .aspectRatio(contentMode: .fill)  // Ensure the image fills the shape
                        .frame(width: geometry.size.width, height: geometry.size.height)  // Dynamically use available size
                        .clipShape(shape)  // Clip the image to the custom shape
                        .overlay(shape.stroke(Color.white, lineWidth: 2))  // Optional: Add a border around the shape
                        .shadow(radius: 10)  // Optional: Add a shadow effect
                } else {
                    // Show the placeholder if no image
                    placeholder
                        .resizable()
                        .aspectRatio(contentMode: .fill)  // Preserve aspect ratio for the placeholder
                        .frame(width: geometry.size.width, height: geometry.size.height)
                        .clipShape(shape)
                        .overlay(shape.stroke(Color.white, lineWidth: 4))
                }
            }
            .onAppear {
                loadImage()
            }
        }
    }
    
    private func loadImage() {
        Task {
            // Start loading image
            isLoading = true
            if let downloadedImage = try await imageCache.loadImage(from: url) {
                // Set the downloaded image and stop loading
                self.image = downloadedImage
                self.isLoading = false
            } else {
                // If failed, stop loading and set placeholder image
                self.isLoading = false
            }
        }
    }
}
