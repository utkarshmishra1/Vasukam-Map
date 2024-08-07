//
//  TripPlanningViewContainer.swift
//  mapp
//
//  Created by utkarsh mishra on 07/08/24.
//

import Foundation
import SwiftUI

struct TripPlanningViewContainer: View {
    @Binding var showTripPlanning: Bool

    var body: some View {
        TripPlanningView(isPresented: $showTripPlanning)
    }
}

