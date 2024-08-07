import Foundation
import CoreLocation

struct Friend: Identifiable {
    let id: UUID
    let name: String
    let location: CLLocationCoordinate2D
}

func generateRandomFriends() -> [Friend] {
    let names = ["Alice", "Bob", "Charlie", "David", "Eve"]
    let locations = [
        CLLocationCoordinate2D(latitude: 37.7749, longitude: -122.4194),
        CLLocationCoordinate2D(latitude: 37.7849, longitude: -122.4094),
        CLLocationCoordinate2D(latitude: 37.7949, longitude: -122.3994),
        CLLocationCoordinate2D(latitude: 37.8049, longitude: -122.3894),
        CLLocationCoordinate2D(latitude: 37.7649, longitude: -122.3794)
    ]
    
    var friends: [Friend] = []
    for i in 0..<names.count {
        friends.append(Friend(id: UUID(), name: names[i], location: locations[i]))
    }
    return friends
}
