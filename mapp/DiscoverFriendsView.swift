import SwiftUI
import CoreLocation

struct DiscoverFriendsView: View {
    @Binding var friends: [Friend]
    @State private var newFriendName = ""
    @State private var newFriendLatitude = ""
    @State private var newFriendLongitude = ""
    @Binding var selectedFriend: Friend?

    var body: some View {
        VStack {
            Text("Discover Friends")
                .font(.largeTitle)
            List(friends) { friend in
                Text(friend.name)
                    .onTapGesture {
                        selectedFriend = friend
                    }
            }

            TextField("Friend's Name", text: $newFriendName)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()

            TextField("Latitude", text: $newFriendLatitude)
                .keyboardType(.decimalPad)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()

            TextField("Longitude", text: $newFriendLongitude)
                .keyboardType(.decimalPad)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()

            Button("Add Friend") {
                if let latitude = Double(newFriendLatitude), let longitude = Double(newFriendLongitude) {
                    let friend = Friend(
                        id: UUID(),
                        name: newFriendName,
                        location: CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
                    )
                    friends.append(friend)
                    newFriendName = ""
                    newFriendLatitude = ""
                    newFriendLongitude = ""
                }
            }
            .padding()
        }
    }
}
