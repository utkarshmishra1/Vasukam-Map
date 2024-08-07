import SwiftUI

struct SettingsView: View {
    @Binding var showSettings: Bool
    @State private var ghostModeEnabled = false
    @State private var visibilityOption = "My Friends"

    var body: some View {
        NavigationView {
            VStack {
                Form {
                    Section(header: Text("My Location")) {
                        HStack {
                            Image("ghostIcon")
                                
                                .resizable()
                                .frame(width: 30, height: 30)
                                .foregroundColor(.black)
                            VStack(alignment: .leading) {
                                Text("Ghost Mode")
                                    .font(.headline)
                                Text("When ghost mode is enabled, anyone can't see your location")
                                    .font(.caption)
                                    .foregroundColor(.gray)
                            }
                            Spacer()
                            Toggle("", isOn: $ghostModeEnabled)
                                .labelsHidden()
                        }
                        .padding(.vertical, 10)

                        Picker(selection: $visibilityOption, label: Text("Visibility")) {
                            Text("My Friends").tag("My Friends")
                            Text("Hide me from").tag("hide me from")
                            Text("Only visible to").tag("Only visible to")
                        }
                        .pickerStyle(MenuPickerStyle())

                        NavigationLink(destination: Text("Share My live location")) {
                            HStack {
                                Text("Share My live location")
                                Spacer()
                                Image(systemName: "chevron.right")
                                    .foregroundColor(.gray)
                            }
                        }
                    }
                }
            }
            .navigationBarTitle("Settings", displayMode: .inline)
            .navigationBarItems(leading: Button(action: {
                showSettings = false
            }) {
                Image(systemName: "arrow.backward")
                    .foregroundColor(.black)
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
