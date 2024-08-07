//
//  CheckContactsView.swift
//  mapp
//
//  Created by utkarsh mishra on 05/08/24.
//

import Foundation
import SwiftUI

struct CheckContactsView: View {
    @State private var contacts: [String] = ["John Doe", "Jane Smith", "Alice Johnson"]

    var body: some View {
        NavigationView {
            List {
                Section(header: Text("Contacts")) {
                    ForEach(contacts, id: \.self) { contact in
                        Text(contact)
                    }
                }
            }
            .navigationTitle("Check Contacts")
        }
    }
}

struct CheckContactsView_Previews: PreviewProvider {
    static var previews: some View {
        CheckContactsView()
    }
}
