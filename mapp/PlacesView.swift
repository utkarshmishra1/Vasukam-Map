//
//  PlacesView.swift
//  mapp
//
//  Created by utkarsh mishra on 07/08/24.
//

import Foundation
import SwiftUI

struct PlacesView: View {
    @State private var places: [Place] = []
    
    var body: some View {
        List(places) { place in
            Text(place.name)
        }
        .onAppear {
            fetchPlaces()
        }
    }
    
    func fetchPlaces() {
        let query = """
        [out:json];
        node["tourism"="attraction"](around:1500,19.0760,72.8777); // Replace with actual destination coordinates
        out body;
        """
        let urlString = "https://overpass-api.de/api/interpreter?data=\(query)"
        
        guard let url = URL(string: urlString.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!) else { return }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let data = data {
                do {
                    let result = try JSONDecoder().decode(OverpassResult.self, from: data)
                    DispatchQueue.main.async {
                        self.places = result.elements.compactMap { element in
                            guard let name = element.tags?.name else { return nil }
                            return Place(name: name, latitude: element.lat, longitude: element.lon)
                        }
                    }
                } catch {
                    print("Error decoding data: \(error)")
                }
            }
        }.resume()
    }
}
