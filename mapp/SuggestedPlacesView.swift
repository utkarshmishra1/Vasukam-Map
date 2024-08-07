import SwiftUI

struct SuggestedPlacesView: View {
    var destination: String
    var startDate: Date
    var endDate: Date
    var tripType: String
    
    @Environment(\.presentationMode) var presentationMode
    
    private var dateFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd MMM"
        return formatter
    }
    
    var body: some View {
        VStack(spacing: 0) {
            // Top bar with map and basic trip information
            VStack(alignment: .leading) {
                HStack {
                    Button(action: {
                        // Dismiss the view
                        presentationMode.wrappedValue.dismiss()
                    }) {
                        Image(systemName: "arrow.left")
                            .foregroundColor(.black)
                            .padding()
                            .background(Color.white)
                            .clipShape(Circle())
                    }
                    Spacer()
                }
                .padding(.top, 10)
                .padding(.horizontal)
                
                HStack {
                    VStack(alignment: .leading) {
                        Text(destination)
                            .font(.title2)
                            .fontWeight(.bold)
                        Text("India")
                            .foregroundColor(.gray)
                        HStack {
                            Text(dateFormatter.string(from: startDate))
                            Text("-")
                            Text(dateFormatter.string(from: endDate))
                        }
                        .foregroundColor(.gray)
                    }
                    Spacer()
                    Image(systemName: "person.crop.circle")
                        .foregroundColor(.black)
                        .padding()
                        .background(Color.white)
                        .clipShape(Circle())
                }
                .padding(.horizontal)
            }
            .padding(.bottom, 10)
            .background(Color(.systemGray6))
            
            // Tabs for Itinerary and Explore
            HStack {
                Text("Itinerary")
                    .font(.headline)
                    .padding()
                    .background(Color.blue)
                    .cornerRadius(8)
                    .foregroundColor(.white)
                Text("Explore")
                    .font(.headline)
                    .padding()
                    .background(Color(.systemGray6))
                    .cornerRadius(8)
                    .foregroundColor(.gray)
            }
            .padding(.horizontal)
            .padding(.top, 10)
            
            // Scrollable list of suggested places
            ScrollView {
                VStack(spacing: 10) {
                    // Example data
                    ForEach(1..<5) { index in
                        SuggestedPlaceRow()
                    }
                    
                    // Add More Place button
                    HStack {
                        Spacer()
                        Text("Add More Place")
                        Spacer()
                        Text("Add")
                            .foregroundColor(.blue)
                    }
                    .padding()
                    .background(Color(.systemGray6))
                    .cornerRadius(8)
                }
                .padding()
            }
            
            // Bottom navigation bar
            BottomNavigationBar()
                .padding(.bottom, 0)
                .navigationBarHidden(true)
        }
    }
}

struct SuggestedPlaceRow: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            HStack {
                Text("10:00 AM - 12:00 PM")
                    .font(.subheadline)
                    .foregroundColor(.gray)
                Spacer()
                Image(systemName: "ellipsis")
                    .foregroundColor(.gray)
            }
            
            Image("Gateway")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(height: 150)
                .clipped()
                .cornerRadius(8)
            
            Text("The Gate Way of India")
                .font(.headline)
            
            HStack {
                ForEach(0..<5) { _ in
                    Image(systemName: "star.fill")
                        .foregroundColor(.yellow)
                        .frame(width: 20, height: 20)
                }
                Text("22,320 Reviews")
                    .foregroundColor(.gray)
            }
            
            Text("Apollo Bandar, Colaba, Mumbai, Maharashtra 400001")
                .foregroundColor(.gray)
            
            HStack {
                Button(action: {}) {
                    Text("Restaurants")
                        .padding()
                        .background(Color(.systemGray6))
                        .cornerRadius(8)
                }
                Button(action: {}) {
                    Text("Cafe")
                        .padding()
                        .background(Color(.systemGray6))
                        .cornerRadius(8)
                }
                Button(action: {}) {
                    Text("Photo Spot")
                        .padding()
                        .background(Color(.systemGray6))
                        .cornerRadius(8)
                }
            }
            
            HStack {
                Text("10m")
                Spacer()
                Button(action: {}) {
                    Text("Direction")
                }
            }
            .padding(.top, 10)
        }
        .padding()
        .background(Color.white)
        .cornerRadius(8)
    }
}

