import Foundation
import CoreLocation

struct FeatureCollection: Codable {
    let features: [Feature]
}

struct Feature: Codable {
    let geometry: RouteGeometry
    let properties: RouteProperties
}

struct RouteGeometry: Codable {
    let coordinates: [[Double]]
}

struct RouteProperties: Codable {
    let segments: [Segment]
}

struct Segment: Codable {
    let distance: Double
    let duration: Double
    let steps: [Step]
}

struct Step: Codable {
    let distance: Double
    let duration: Double
    let instruction: String
    let name: String
    let type: Int
    let wayPoints: [Int]

    enum CodingKeys: String, CodingKey {
        case distance
        case duration
        case instruction
        case name
        case type
        case wayPoints = "way_points"
    }
}

class RoutingManager {
    static let shared = RoutingManager()
    let apiKey = "5b3ce3597851110001cf6248987f76619df042d1afb921cbd58ac6bd"  // Replace with your actual OpenRouteService API key
    
    func getRoute(from origin: CLLocationCoordinate2D, to destination: CLLocationCoordinate2D, completion: @escaping (FeatureCollection?) -> Void) {
        // Placeholder implementation for the sake of the example
        completion(nil)
    }
}
