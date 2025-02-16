//
//  ListRowView.swift
//  LloydsAssignment
//
//  Created by BP Maurya on 16/02/25.
//

import SwiftUI

struct ListRowView: View {
    
    let company: Company
    
    var body: some View {
        VStack {
            HStack(spacing: 10) {
                
                CacheAsyncImage(url: URL(string: company.image)!, placeholder: Image(systemName: "photo.fill"), shape: Circle())
                    .frame(width: 50, height: 50)
                
                VStack(alignment: .leading, spacing: 10) {
                    Text(company.name)
                        .font(.headline)
                    Text(company.symbol)
                        .font(.subheadline)
                }
                Spacer()
            }
            Text(company.description)
                .lineLimit(2)
                .font(.caption)
        }
    }
}
