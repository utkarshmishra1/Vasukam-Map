import MapKit
class OSMTileOverlay: MKTileOverlay {
    override var urlTemplate: String {
        return "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png"
    }
    
    override func url(forTilePath tilePath: MKTileOverlayPath) -> URL {
        let urlString = urlTemplate
            .replacingOccurrences(of: "{s}", with: getSubdomain(for: tilePath))
            .replacingOccurrences(of: "{z}", with: "\(tilePath.z)")
            .replacingOccurrences(of: "{x}", with: "\(tilePath.x)")
            .replacingOccurrences(of: "{y}", with: "\(tilePath.y)")
        return URL(string: urlString)!
    }
    
    private func getSubdomain(for tilePath: MKTileOverlayPath) -> String {
        return ["a", "b", "c"].randomElement()!
    }
}
