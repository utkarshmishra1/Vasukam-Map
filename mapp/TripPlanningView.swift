import Foundation
import SwiftUI

struct PlanTripView: View {
    @State private var destination = ""
    @State private var startDate = Date()
    @State private var endDate = Date()

    var body: some View {
        VStack {
            Text("Plan a New Trip")
                .font(.largeTitle)
                .padding()
            
            TextField("Where?", text: $destination)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
            
            DatePicker("Choose a Start Date", selection: $startDate, displayedComponents: .date)
                .padding()
            
            DatePicker("Choose an End Date", selection: $endDate, displayedComponents: .date)
                .padding()
            
            Button(action: {
                // Handle trip planning logic here
            }) {
                Text("Find Best Places")
                    .font(.headline)
                    .foregroundColor(.white)
                    .padding()
                    .background(Color.blue)
                    .cornerRadius(8)
            }
            .padding()
        }
        .padding()
    }
}
