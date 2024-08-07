import SwiftUI

struct TripPlanningView: View {
    @Binding var isPresented: Bool
    @State private var destination = ""
    @State private var startDate = Date()
    @State private var endDate = Date()
    @State private var tripType = "Solo"
    @State private var showDatePicker = false

    var body: some View {
        NavigationView {
            VStack {
                HStack {
                    Button(action: {
                        isPresented = false
                    }) {
                        Image(systemName: "xmark")
                            .foregroundColor(.black)
                            .padding()
                            .background(Color.white)
                            .clipShape(Circle())
                    }
                    Spacer()
                }
                .padding(.top, 10)
                .padding(.horizontal)

                Text("Plan a New Trip")
                    .font(.title)
                    .fontWeight(.bold)
                    .padding(.top, 10)

                Text("Our Travel AI feature guarantees to deliver optimal results for your journey.")
                    .font(.subheadline)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal)
                    .padding(.top, 5)

                TextField("Where to? e.g., Mumbai, Maharashtra, India", text: $destination)
                    .padding()
                    .background(Color(.systemGray6))
                    .cornerRadius(8)
                    .padding(.horizontal)
                    .padding(.top, 10)

                Button(action: {
                    showDatePicker.toggle()
                }) {
                    HStack {
                        if startDate == endDate {
                            Text("Choose a Date")
                                .foregroundColor(.gray)
                        } else {
                            Text("\(startDate.formatted(.dateTime.month().day())) - \(endDate.formatted(.dateTime.month().day()))")
                                .foregroundColor(.gray)
                        }
                        Spacer()
                        Image(systemName: "calendar")
                            .foregroundColor(.gray)
                    }
                    .padding()
                    .background(Color(.systemGray6))
                    .cornerRadius(8)
                    .padding(.horizontal)
                    .padding(.top, 10)
                }
                .sheet(isPresented: $showDatePicker) {
                    CustomRangeDatePickerView(selectedStartDate: $startDate, selectedEndDate: $endDate)
                }

                Text("How Many Are You?")
                    .font(.headline)
                    .padding(.top, 10)
                    .padding(.horizontal)

                HStack(spacing: 20) {
                    TripTypeButton(tripType: $tripType, type: "Solo", imageName: "person")
                    TripTypeButton(tripType: $tripType, type: "Couple", imageName: "person.2")
                    TripTypeButton(tripType: $tripType, type: "Family", imageName: "person.3")
                    TripTypeButton(tripType: $tripType, type: "Friends", imageName: "person.2.circle")
                }
                .padding(.horizontal)
                .padding(.top, 10)

                Spacer()

                NavigationLink(destination: SuggestedPlacesView(destination: destination, startDate: startDate, endDate: endDate, tripType: tripType)) {
                    Text("Find Best Places")
                        .font(.headline)
                        .foregroundColor(.white)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.blue)
                        .cornerRadius(8)
                }
                .padding()
            }
            .navigationBarHidden(true)
            .onTapGesture {
                // Dismiss the keyboard when tapping outside the TextField
                hideKeyboard()
            }
        }
    }
}

struct TripTypeButton: View {
    @Binding var tripType: String
    let type: String
    let imageName: String

    var body: some View {
        Button(action: {
            tripType = type
        }) {
            VStack {
                Image(systemName: imageName)
                    .foregroundColor(tripType == type ? .yellow : .gray)
                    .padding()
                    .background(tripType == type ? Color.yellow.opacity(0.2) : Color.gray.opacity(0.2))
                    .clipShape(Circle())
                Text(type)
                    .foregroundColor(tripType == type ? .yellow : .gray)
                    .font(.footnote)
            }
        }
    }
}

// Extension to hide the keyboard
extension View {
    func hideKeyboard() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
