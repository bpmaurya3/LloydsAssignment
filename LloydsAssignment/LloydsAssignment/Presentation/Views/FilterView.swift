//
//  FilterView.swift
//  LloydsAssignment
//
//  Created by BP Maurya on 16/02/25.
//

import SwiftUI

struct FilterView: View {
    @Binding var selectedSector: String?
    @Environment(\.dismiss) var dismiss
    var sectors: [String] // List of unique sectors
    
    var body: some View {
        NavigationStack {
            VStack {
                Text("Choose a Sector")
                    .font(.title)
                    .padding()
                
                // List of sectors to choose from
                List(sectors, id: \.self) { sector in
                    Button(action: {
                        selectedSector = sector
                    }) {
                        HStack {
                            Text(sector)
                            Spacer()
                            if selectedSector == sector {
                                Image(systemName: "checkmark")
                                    .foregroundColor(.blue)
                            }
                        }
                    }
                }
                .accessibilityIdentifier("filterList")
                
                Spacer()
                
                Button("Done") {
                    // Dismiss the filter view
                    dismiss()
                }
                .padding()
                .accessibilityIdentifier("DoneButton")
            }
            .navigationTitle("Filter")
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    // Cancel button to reset the selected sector
                    Button("Cancel") {
                        selectedSector = nil
                        dismiss()
                    }
                    .accessibilityIdentifier("CancelButton")
                }
            }
        }
    }
}

#Preview {
    FilterView(selectedSector: .constant(nil), sectors: [])
}
