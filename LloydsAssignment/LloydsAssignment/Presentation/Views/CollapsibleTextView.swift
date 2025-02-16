//
//  CollapsibleTextView.swift
//  LloydsAssignment
//
//  Created by BP Maurya on 16/02/25.
//

import SwiftUI

struct CollapsibleTextView: View {
    
    @State private var isExpanded = false
    
    let description: String
    
    var body: some View {
        VStack {
            Text(description)
                .font(.caption)
                .lineLimit(isExpanded ? nil : 2) // Show up to 2 lines when collapsed, no limit when expanded
                .frame(maxWidth: .infinity, alignment: .leading)
            
            // Only show the button if the text is longer than two line
            if description.count > 120 {  // Adjust this threshold based on how much content you want before showing the button
                HStack{
                    Spacer()
                    Button(action: {
                        withAnimation(.easeInOut(duration: 0.3)) {
                            isExpanded.toggle()
                        }
                    }) {
                        Text(isExpanded ? "Show Less" : "Show More")
                            .font(.caption)
                            .foregroundColor(.blue)
                    }
                }
            }
        }
    }
}

#Preview {
    CollapsibleTextView(description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus luctus urna sed urna ultricies ac tempor dui sagittis. In condimentum facilisis porta. Sed nec diam eu diam mattis viverra. Nulla fringilla, orci ac euismod semper, magna diam porttitor mauris, quis sollicitudin sapien justo in libero. Sed in libero ut nibh placerat accumsan. Praesent ac massa at ligula laoreet iaculis. Vivamus est nulla, malesuada eu pulvinar eu, congue vel dui. Cras hendrerit tincidunt tempor.")
}
