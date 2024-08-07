import SwiftUI
import MapKit

struct ContentView: View {
    @State private var selectedStyle: MKMapType = .standard
    @State private var showMapStyleOptions = false
    @State private var showDiscoverFriends = false
    @State private var showTripPlanning = false
    @State private var friends: [Friend] = generateRandomFriends()
    @State private var selectedFriend: Friend?
    @State private var showNavigationDetail = false
    @State private var mapView = MKMapView()
    @State private var showSettings = false

    var body: some View {
        ZStack {
            MapView(
                origin: CLLocationCoordinate2D(latitude: 37.7749, longitude: -122.4194),
                mapType: selectedStyle,
                friends: friends,
                selectedFriend: $selectedFriend,
                showNavigationDetail: $showNavigationDetail
            )
            .edgesIgnoringSafeArea(.all)

            VStack {
                // HStack for Profile and Dombivli
                HStack(spacing: 20) {
                    ProfileView()
                        .padding(.leading, 10)
                    
                    DombivliView()
                    
                    Spacer()
                }
                .padding(.top, 30) // Adjust this value to move the profile and Dombivli section up
                
                if showNavigationDetail, let selectedFriend = selectedFriend {
                    NavigationDetailView(friend: selectedFriend, showNavigationDetail: $showNavigationDetail)
                        .background(Color.white)
                        .cornerRadius(10)
                        .shadow(radius: 5)
                        .padding()
                        .transition(.move(edge: .top))
                }

                Spacer()

                // Stack for AI Trav, Discover, and Bookmark
                HStack(spacing: 16) {
                    AITRavView(showTripPlanning: $showTripPlanning)
                    
                    DiscoverView()
                    
                    BookmarkView()
                }
                .padding(.bottom, 0) // Ensure it is just above the navigation bar
                
                // Bottom Navigation Bar
                BottomNavigationBar()
                    .padding(.bottom, 0)
            }

            VStack {
                Spacer()
                
                HStack {
                    Spacer()
                    
                    StackOfButtonsView(
                        showMapStyleOptions: $showMapStyleOptions,
                        showDiscoverFriends: $showDiscoverFriends,
                        showTripPlanning: $showTripPlanning,
                        showSettings: $showSettings
                    )
                    .padding(.trailing, 1) // Add right padding to place the buttons correctly
                }
                .padding(.bottom, 578) // Adjust this value to align with the "Bookmark" button
            }

            VStack {
                Spacer()
                
                HStack {
                    Spacer()
                    
                    VStack {
                        PlusMinusStackView(mapView: $mapView)
                            
                        LocationButtonView()
                        
                    }
                    .padding(.trailing, 0) // Add right padding to place the buttons correctly
                }
                .padding(.bottom, 300) // Adjust this value to align with the "Bookmark" button
            }
        }
        .fullScreenCover(isPresented: $showSettings) {
            SettingsView(showSettings: $showSettings)
        }
        .sheet(isPresented: $showMapStyleOptions) {
            MapStyleView(selectedStyle: $selectedStyle)
                .presentationDetents([.medium, .large])
        }

        .sheet(isPresented: $showDiscoverFriends) {
            DiscoverFriendsView(friends: $friends, selectedFriend: $selectedFriend)
        }
        .fullScreenCover(isPresented: $showTripPlanning) {
            TripPlanningView(isPresented: $showTripPlanning)
        }
    }
}



struct ProfileView: View {
    var body: some View {
        Button(action: {
            // Action for Profile Picture
        }) {
            VStack {
                Image("Profile_Image")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 44, height: 44)
                    .clipShape(Circle())
                    .overlay(
                        Circle()
                            .stroke(Color.white, lineWidth: 4)
                            .padding(2)
                    )
                    .background(Circle().fill(Color.white).frame(width: 52, height: 52))
            }
        }
    }
}



struct DombivliView: View {
    var body: some View {
        RoundedRectangle(cornerRadius: 25)
            .fill(Color.white)
            .frame(width: 200, height: 50)
            .overlay(HStack {
                Text("Dombivli")
                    .foregroundColor(.black)
            })
            .padding(.horizontal)
    }
}



struct AITRavView: View {
    @Binding var showTripPlanning: Bool

    var body: some View {
        RoundedRectangle(cornerRadius: 25)
            .fill(Color.white)
            .frame(height: 40)
            .overlay(
                VStack {
                    Button(action: {
                        showTripPlanning = true
                    }) {
                        HStack {
                            Circle()
                                .fill(Color.purple)
                                .frame(width: 24, height: 24)
                                .overlay(Image("AI")
                                    .resizable()
                                    .frame(width: 24, height: 24)
                                    .foregroundColor(.white))
                            
                            Text("AI Trav")
                                .font(.caption)
                                .foregroundColor(.primary)
                        }
                    }
                }
            )
    }
}

struct DiscoverView: View {
    var body: some View {
        RoundedRectangle(cornerRadius: 25)
            .fill(Color.white)
            .frame(height: 40)
            .overlay(
                VStack {
                    Button(action: {
                        // Action for Discover
                    }) {
                        HStack {
                            Circle()
                                .fill(Color.blue)
                                .frame(width: 24, height: 24)
                                .overlay(Image( "Discover")
                                    .resizable()
                                    .frame(width: 24, height: 24)
                                    .clipShape(Circle())
                                    .foregroundColor(.white))
                            
                            Text("Discover")
                                .font(.caption)
                                .foregroundColor(.primary)
                        }
                    }
                }
            )
    }
}

struct BookmarkView: View {
    var body: some View {
        RoundedRectangle(cornerRadius: 25)
            .fill(Color.white)
            .frame(height: 40)
            .overlay(
                VStack {
                    Button(action: {
                        // Action for Bookmark
                    }) {
                        HStack {
                            Circle()
                                .fill(Color.white)
                                .frame(width: 24, height: 24)
                                .overlay(Image( "Bookmark")
                                    .resizable()
                                    .frame(width: 24, height: 24)
                                    .foregroundColor(.white))
                            
                            Text("Bookmark")
                                .font(.caption)
                                .foregroundColor(.primary)
                        }
                    }
                }
            )
    }
}






struct LocationButtonView: View {
    var body: some View {
        Button(action: {
            // Define the action for the location button
        }) {
            Image(systemName: "location.fill") // Using a built-in SF Symbol for the location icon
                .resizable()
                .frame(width: 15, height: 15)
                .foregroundColor(.black)
                .padding()
                .background(Color.white)
                .clipShape(Circle())
                .overlay(Circle().stroke(Color.white, lineWidth: 2))
        }
        .shadow(radius: 5)
    }
}






struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
