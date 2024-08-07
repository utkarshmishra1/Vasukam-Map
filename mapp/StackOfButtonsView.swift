//
//  StackOfButtonsView.swift
//  mapp
//
//  Created by utkarsh mishra on 07/08/24.
//

import Foundation
import SwiftUI
struct StackOfButtonsView: View {
    @Binding var showMapStyleOptions: Bool
    @Binding var showDiscoverFriends: Bool
    @Binding var showTripPlanning: Bool
    @Binding var showSettings: Bool

    var body: some View {
        RoundedRectangle(cornerRadius: 25)
            .fill(Color.white)
            .frame(width: 50, height: 150)
            .overlay(
                VStack(spacing: 1) {
                    Button(action: {
                        showMapStyleOptions = true
                    }) {
                        Image(systemName: "square.3.layers.3d")
                            .resizable()
                            .frame(width: 25, height: 25)
                            .padding()
                            .foregroundColor(.black)
                    }
                    
                    Button(action: {
                        showDiscoverFriends = true
                    }) {
                        Image(systemName: "magnifyingglass")
                            .resizable()
                            .frame(width: 25, height: 25)
                            .padding()
                            .foregroundColor(.black)
                    }
                    
                    Button(action: {
                        showSettings = true
                    }) {
                        Image(systemName: "gearshape")
                            .resizable()
                            .frame(width: 25, height: 25)
                            .padding()
                            .foregroundColor(.black)
                    }
                }
            )
            .padding(.horizontal)
    }
}

