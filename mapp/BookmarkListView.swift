import SwiftUI

struct BookmarkListView: View {
    @State private var bookmarks: [Bookmark] = generateRandomBookmarks()

    var body: some View {
        NavigationView {
            List {
                ForEach(bookmarks) { bookmark in
                    HStack {
                        Image("your_custom_image")  // Replace with your custom image name
                            .resizable()
                            .frame(width: 50, height: 50)
                            .cornerRadius(8)
                        VStack(alignment: .leading) {
                            Text(bookmark.title)
                                .font(.headline)
                            Text(bookmark.description)
                                .font(.subheadline)
                        }
                    }
                }
            }
            .navigationBarTitle("Bookmarks", displayMode: .inline)
        }
    }
}

struct Bookmark: Identifiable {
    let id = UUID()
    let title: String
    let description: String
}

func generateRandomBookmarks() -> [Bookmark] {
    return [
        Bookmark(title: "Place 1", description: "Description 1"),
        Bookmark(title: "Place 2", description: "Description 2"),
        Bookmark(title: "Place 3", description: "Description 3")
    ]
}
