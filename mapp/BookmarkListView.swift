import Foundation
import SwiftUI

struct BookmarksView: View {
    @State private var bookmarks: [String] = []

    var body: some View {
        VStack {
            Text("Bookmarks")
                .font(.largeTitle)
                .padding()
            
            List(bookmarks, id: \.self) { bookmark in
                Text(bookmark)
            }
            
            Button(action: {
                // Handle adding a new bookmark
                let newBookmark = "Bookmark \(bookmarks.count + 1)"
                bookmarks.append(newBookmark)
            }) {
                Text("Add Bookmark")
                    .font(.headline)
                    .foregroundColor(.white)
                    .padding()
                    .background(Color.blue)
                    .cornerRadius(8)
            }
            .padding()
        }
    }
}
