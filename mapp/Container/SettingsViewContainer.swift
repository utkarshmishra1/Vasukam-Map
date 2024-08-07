//
//  SettingsViewContainer.swift
//  mapp
//
//  Created by utkarsh mishra on 07/08/24.
//

import Foundation
import SwiftUI

struct SettingsViewContainer: View {
    @Binding var showSettings: Bool

    var body: some View {
        SettingsView(showSettings: $showSettings)
    }
}

