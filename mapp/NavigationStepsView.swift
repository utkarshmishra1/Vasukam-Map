import SwiftUI

struct NavigationStepsView: View {
    let steps: [String]

    var body: some View {
        VStack {
            Text("Navigation Steps")
                .font(.largeTitle)
                .padding()
            
            List(steps, id: \.self) { step in
                Text(step)
            }
        }
    }
}
