import SwiftUI

struct SettingsView: View {
    @Binding var showSettings: Bool

    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Account")) {
                    NavigationLink(destination: Text("Profile Settings")) {
                        Text("Profile")
                    }
                    NavigationLink(destination: Text("Security Settings")) {
                        Text("Security")
                    }
                }

                Section(header: Text("Preferences")) {
                    Toggle(isOn: .constant(true)) {
                        Text("Enable Notifications")
                    }
                    NavigationLink(destination: Text("Language Settings")) {
                        Text("Language")
                    }
                }

                Section(header: Text("Support")) {
                    NavigationLink(destination: Text("Help & Feedback")) {
                        Text("Help & Feedback")
                    }
                    NavigationLink(destination: Text("About Us")) {
                        Text("About Us")
                    }
                }

                Button(action: {
                    // Action for logout
                }) {
                    Text("Log Out")
                        .foregroundColor(.red)
                }
            }
            .navigationBarTitle("Settings")
            .navigationBarItems(trailing: Button("Done") {
                showSettings = false
            })
        }
    }
}

struct SettingsView_Previews: PreviewProvider {
    @State static var showSettings = true

    static var previews: some View {
        SettingsView(showSettings: $showSettings)
    }
}
