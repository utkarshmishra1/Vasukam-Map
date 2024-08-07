//
//  GetLocationButton.swift
//  mapp
//
//  Created by utkarsh mishra on 04/08/24.
//

import Foundation
// GetLocationButton.swift
import SwiftUI
import CoreLocation

struct GetLocationButton: View {
    @StateObject private var locationManager = LocationManager()

    var body: some View {
        Button(action: {
            locationManager.requestLocation()
        }) {
            Image(systemName: "location.circle.fill") // Add your custom image here
                .resizable()
                .frame(width: 50, height: 50)
                .foregroundColor(.blue)
                .background(Color.white)
                .clipShape(Circle())
                .shadow(radius: 5)
        }
    }
}

class LocationManager: NSObject, ObservableObject, CLLocationManagerDelegate {
    private let manager = CLLocationManager()
    @Published var userLocation: CLLocation?

    override init() {
        super.init()
        manager.delegate = self
        manager.desiredAccuracy = kCLLocationAccuracyBest
        manager.requestWhenInUseAuthorization()
    }

    func requestLocation() {
        manager.requestLocation()
    }

    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.first else { return }
        userLocation = location
        NotificationCenter.default.post(name: NSNotification.Name("UserLocationUpdated"), object: location)
    }

    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("Failed to find user's location: \(error.localizedDescription)")
    }
}
