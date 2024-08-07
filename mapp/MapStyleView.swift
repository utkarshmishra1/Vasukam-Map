import SwiftUI
import MapKit

struct MapStyleView: View {
    @Binding var selectedStyle: MKMapType
    let mapStyles: [(title: String, type: MKMapType, image: String)] = [
        ("Default", .standard, "Default"),
        ("Satellite", .satellite, "satellite"),
        ("Heat map", .standard, "heatmapp"), // Replace with appropriate map type if available
        ("Heat Map", .standard, "HeatMap"), // Placeholder image
        ("Hood map", .standard, "Hoodmap")     // Placeholder image
    ]
    
    var body: some View {
        VStack {
            Text("Map Style")
                .font(.headline)
                .padding(.top)

            HStack {
                Text("Light")
                Spacer()
                Text("Dark")
                Spacer()
                Text("System")
            }
            .padding()

            LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible())]) {
                ForEach(mapStyles, id: \.title) { style in
                    VStack {
                        Image(style.image)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 100, height: 100)
                            .border(selectedStyle == style.type ? Color.blue : Color.clear, width: 2)
                            .onTapGesture {
                                selectedStyle = style.type
                            }
                        Text(style.title)
                            .font(.caption)
                    }
                }
            }
            .padding()

            Spacer()
        }
    }
}
