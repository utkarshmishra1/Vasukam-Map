import SwiftUI

struct CustomRangeDatePickerView: View {
    @Binding var selectedStartDate: Date
    @Binding var selectedEndDate: Date
    @Environment(\.presentationMode) var presentationMode
    @State private var displayedMonth = Date()
    
    private var dateFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateFormat = "MMM-yy"
        return formatter
    }
    
    private var daysInMonth: [Date] {
        let calendar = Calendar.current
        let range = calendar.range(of: .day, in: .month, for: displayedMonth)!
        let startOfMonth = calendar.date(from: calendar.dateComponents([.year, .month], from: displayedMonth))!
        
        return range.compactMap { day in
            calendar.date(byAdding: .day, value: day - 1, to: startOfMonth)
        }
    }
    
    private var selectedRange: [Date] {
        let calendar = Calendar.current
        return calendar.generateDates(
            inside: DateInterval(start: selectedStartDate, end: selectedEndDate),
            matching: DateComponents(hour: 0, minute: 0, second: 0)
        )
    }
    
    var body: some View {
        VStack {
            HStack {
                Button(action: {
                    presentationMode.wrappedValue.dismiss()
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
            
            Text("Choose Start Date")
                .font(.title2)
                .fontWeight(.bold)
                .padding(.top, 10)
            
            HStack {
                Button(action: {
                    displayedMonth = Calendar.current.date(byAdding: .month, value: -1, to: displayedMonth)!
                }) {
                    Image(systemName: "chevron.left")
                }
                
                Text(dateFormatter.string(from: displayedMonth))
                    .font(.headline)
                    .padding(.horizontal)
                
                Button(action: {
                    displayedMonth = Calendar.current.date(byAdding: .month, value: 1, to: displayedMonth)!
                }) {
                    Image(systemName: "chevron.right")
                }
            }
            .padding(.vertical, 10)
            
            LazyVGrid(columns: Array(repeating: GridItem(.flexible()), count: 7), spacing: 10) {
                ForEach(["S", "M", "T", "W", "T", "F", "S"], id: \.self) { day in
                    Text(day)
                        .fontWeight(.bold)
                        .foregroundColor(.gray)
                }
                
                ForEach(daysInMonth, id: \.self) { date in
                    Text("\(Calendar.current.component(.day, from: date))")
                        .padding()
                        .background(selectedRange.contains(date) ? Color.blue : Color(.systemGray6))
                        .foregroundColor(selectedRange.contains(date) ? .white : .black)
                        .clipShape(Circle())
                        .onTapGesture {
                            if selectedStartDate == selectedEndDate {
                                selectedStartDate = date
                            } else if date < selectedStartDate {
                                selectedStartDate = date
                            } else {
                                selectedEndDate = date
                            }
                        }
                }
            }
            .padding()
            
            Button(action: {
                presentationMode.wrappedValue.dismiss()
            }) {
                Text("Done")
                    .foregroundColor(.white)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.blue)
                    .cornerRadius(8)
            }
            .padding(.horizontal)
            
            Button(action: {
                presentationMode.wrappedValue.dismiss()
            }) {
                Text("Cancel")
                    .foregroundColor(.red)
                    .padding()
            }
            
            Spacer()
        }
        .navigationBarHidden(true)
    }
}

extension Calendar {
    func generateDates(
        inside interval: DateInterval,
        matching components: DateComponents
    ) -> [Date] {
        var dates: [Date] = []
        dates.append(interval.start)

        enumerateDates(
            startingAfter: interval.start,
            matching: components,
            matchingPolicy: .nextTime
        ) { date, _, stop in
            if let date = date {
                if date < interval.end {
                    dates.append(date)
                } else {
                    stop = true
                }
            }
        }

        return dates
    }
}
