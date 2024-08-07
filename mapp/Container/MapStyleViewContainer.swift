//
//  MapStyleViewContainer.swift
//  mapp
//
//  Created by utkarsh mishra on 07/08/24.
//

import Foundation
import SwiftUI
import MapKit

struct MapStyleViewContainer: View {
    @Binding var selectedStyle: MKMapType

    var body: some View {
        MapStyleView(selectedStyle: $selectedStyle)
    }
}

