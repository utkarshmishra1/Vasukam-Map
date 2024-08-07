//
//  DiscoverFriendsViewContainer.swift
//  mapp
//
//  Created by utkarsh mishra on 07/08/24.
//

import Foundation
import SwiftUI

struct DiscoverFriendsViewContainer: View {
    @Binding var friends: [Friend]
    @Binding var selectedFriend: Friend?

    var body: some View {
        DiscoverFriendsView(friends: $friends, selectedFriend: $selectedFriend)
    }
}
