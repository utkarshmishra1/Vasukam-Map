//
//  ContactView.swift
//  mapp
//
//  Created by utkarsh mishra on 05/08/24.
//

import Foundation
import SwiftUI
import Contacts

struct ContactsView: View {
    @Binding var isPresented: Bool
    @State private var contacts: [CNContact] = []
    @State private var permissionDenied = false

    var body: some View {
        NavigationView {
            Group {
                if permissionDenied {
                    Text("Access to contacts is denied. Please enable it in settings.")
                } else {
                    List(contacts, id: \.identifier) { contact in
                        Text(contact.givenName + " " + contact.familyName)
                    }
                }
            }
            .navigationTitle("Select Contacts")
            .toolbar {
                ToolbarItem(placement: .cancellationAction) {
                    Button("Cancel") {
                        isPresented = false
                    }
                }
            }
            .onAppear(perform: requestAccess)
        }
    }

    func requestAccess() {
        let store = CNContactStore()
        store.requestAccess(for: .contacts) { granted, error in
            if granted {
                fetchContacts()
            } else {
                permissionDenied = true
            }
        }
    }

    func fetchContacts() {
        let store = CNContactStore()
        let keys = [CNContactGivenNameKey, CNContactFamilyNameKey]
        let request = CNContactFetchRequest(keysToFetch: keys as [CNKeyDescriptor])

        do {
            var fetchedContacts: [CNContact] = []
            try store.enumerateContacts(with: request) { contact, stop in
                fetchedContacts.append(contact)
            }
            contacts = fetchedContacts
        } catch {
            print("Failed to fetch contacts: \(error)")
        }
    }
}

struct ContactsView_Previews: PreviewProvider {
    static var previews: some View {
        ContactsView(isPresented: .constant(true))
    }
}
