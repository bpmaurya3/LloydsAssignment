//
//  HistoricalDataView.swift
//  LloydsAssignment
//
//  Created by BP Maurya on 16/02/25.
//

import SwiftUI

struct HistoricalDataView: View {
    
    let historicalData: [HistoricalData]
    
    var body: some View {
        VStack(spacing: 10) {
            Text("Historical Data")
                .font(.title)
                .padding(.top)
            
            ForEach(historicalData, id: \.date) { data in
                HStack {
                    Text(data.date)
                    Spacer()
                    Text("$\(data.value, specifier: "%.2f")")
                }
                Divider()
            }
        }
    }
}


