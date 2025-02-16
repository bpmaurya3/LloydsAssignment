//
//  DetailsHeaderView.swift
//  LloydsAssignment
//
//  Created by BP Maurya on 16/02/25.
//

import SwiftUI

struct DetailsHeaderView: View {
    let company: Company
    
    var body: some View {
        ScrollView {
            VStack(spacing: 20) { 
                // Cover Image
                ZStack {
                    CacheAsyncImage(url: URL(string: company.image)!, placeholder: Image(systemName: "photo.fill"), shape: Rectangle())
                        .frame(height: 250)
                        .background(.gray)
                    
                    // Profile Image (Circular) inside the ZStack
                    VStack {
                        Spacer() // Push the profile image up
                        CacheAsyncImage(url: URL(string: company.image)!, placeholder: Image(systemName: "photo.fill"), shape: Circle())
                            .frame(width: 150, height: 150)
                            .padding(.bottom, -75) // Overlap the cover image
                    }
                }
                
                // Profile Name and Description
                VStack(spacing: 10) {
                    // Product Name
                    Text(company.name)
                        .font(.largeTitle)
                        .fontWeight(.bold)
                    
                    // Product Type and Symbol
                    HStack {
                        Text(company.type)
                            .font(.headline)
                        Spacer()
                        Text(company.symbol)
                            .font(.headline)
                            .foregroundColor(.gray)
                    }
                    
                    // Current Value and Percentage Change
                    HStack {
                        Text("Current Value: $\(company.currentValue, specifier: "%.2f")")
                            .font(.title2)
                        Spacer()
                        Text("\(company.percentageChange >= 0 ? "+" : "")\(company.percentageChange, specifier: "%.2f")%")
                            .font(.title2)
                            .foregroundColor(company.percentageChange >= 0 ? .green : .red)
                    }
                }
                .padding(.top, 60) // Additional padding to make it look nice
            }
        }
        .edgesIgnoringSafeArea(.top) // To ignore safe area for the cover image
    }
}

