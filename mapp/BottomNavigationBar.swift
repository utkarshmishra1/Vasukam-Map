//
//  BottomNavigationBar.swift
//  mapp
//
//  Created by utkarsh mishra on 07/08/24.
//

import Foundation
import SwiftUI
struct BottomNavigationBar: View {
    var body: some View {
        HStack {
            Spacer()
            Button(action: {
                // Action for Home
            }) {
                VStack {
                    Image(systemName: "house.fill")
                        .resizable()
                        .frame(width: 24, height: 24)
                        .foregroundColor(.gray)
                    Text("Home")
                        .font(.caption)
                        .foregroundColor(.gray)
                }
            }
            Spacer()
            Button(action: {
                // Action for Discover
            }) {
                VStack {
                    Image(systemName: "location.fill")
                        .resizable()
                        .frame(width: 24, height: 24)
                        .foregroundColor(.primary)
                    Text("Discover")
                        .font(.caption)
                        .foregroundColor(.primary)
                }
            }
            Spacer()
            Button(action: {
                // Action for Post
            }) {
                VStack {
                    Image(systemName: "plus.circle.fill")
                        .resizable()
                        .frame(width: 24, height: 24)
                        .foregroundColor(.gray)
                    Text("Post")
                        .font(.caption)
                        .foregroundColor(.gray)
                }
            }
            Spacer()
            Button(action: {
                // Action for Flicks
            }) {
                VStack {
                    Image(systemName: "film.fill")
                        .resizable()
                        .frame(width: 24, height: 24)
                        .foregroundColor(.gray)
                    Text("Flicks")
                        .font(.caption)
                        .foregroundColor(.gray)
                }
            }
            Spacer()
            Button(action: {
                // Action for Marketplace
            }) {
                VStack {
                    Image(systemName: "bag.fill")
                        .resizable()
                        .frame(width: 24, height: 24)
                        .foregroundColor(.gray)
                    Text("Marketplace")
                        .font(.caption)
                        .foregroundColor(.gray)
                }
            }
            Spacer()
        }
        .frame(height: 55)
        .background(Color.white)
        .shadow(radius: 10)
    }
}
