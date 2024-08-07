import SwiftUI
import MapKit

struct NavigationDetailView: View {
    var friend: Friend
    @Binding var showNavigationDetail: Bool
    @State private var transportType: MKDirectionsTransportType = .automobile
    @State private var route: MKRoute?
    @State private var steps: [MKRoute.Step] = []

    var body: some View {
        ZStack {
            MapView(
                origin: CLLocationCoordinate2D(latitude: 37.7749, longitude: -122.4194),
                mapType: .standard,
                friends: [friend],
                selectedFriend: .constant(friend),
                showNavigationDetail: $showNavigationDetail,
                route: route
            )
            .edgesIgnoringSafeArea(.all)

            VStack {
                if let route = route {
                    VStack {
                        Text("Distance: \(String(format: "%.2f", route.distance / 1000)) km")
                        Text("Expected Travel Time: \(String(format: "%.2f", route.expectedTravelTime / 60)) mins")
                        
                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack(spacing: 20) {
                                ForEach(steps, id: \.self) { step in
                                    VStack {
                                        Text(step.instructions)
                                            .font(.headline)
                                        Text("\(String(format: "%.2f", step.distance / 1000)) km")
                                            .font(.subheadline)
                                    }
                                    .padding()
                                    .background(Color.white.opacity(0.8))
                                    .cornerRadius(10)
                                    .shadow(radius: 5)
                                }
                            }
                            .padding()
                        }
                    }
                    .padding()
                    .background(Color.white.opacity(0.8))
                    .cornerRadius(10)
                    .shadow(radius: 5)
                    .padding()

                    Spacer()

                    HStack {
                        Picker("Transport Type", selection: $transportType) {
                            Text("Automobile").tag(MKDirectionsTransportType.automobile)
                            Text("Walking").tag(MKDirectionsTransportType.walking)
                            Text("Transit").tag(MKDirectionsTransportType.transit)
                        }
                        .pickerStyle(SegmentedPickerStyle())
                        .padding()

                        Button("Recalculate") {
                            startNavigation(to: friend.location, transportType: transportType)
                        }
                        .padding()
                    }
                } else {
                    Text("Calculating route...")
                        .padding()
                        .background(Color.white.opacity(0.8))
                        .cornerRadius(10)
                        .shadow(radius: 5)
                }
            }
            .onAppear {
                startNavigation(to: friend.location, transportType: transportType)
            }
        }
    }

    private func startNavigation(to destination: CLLocationCoordinate2D, transportType: MKDirectionsTransportType) {
        let request = MKDirections.Request()
        request.source = MKMapItem.forCurrentLocation()
        request.destination = MKMapItem(placemark: MKPlacemark(coordinate: destination))
        request.transportType = transportType

        let directions = MKDirections(request: request)
        directions.calculate { response, error in
            if let route = response?.routes.first {
                self.route = route
                self.steps = route.steps
            } else {
                print("Error calculating route: \(error?.localizedDescription ?? "Unknown error")")
            }
        }
    }
}
