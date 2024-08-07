import SwiftUI
import MapKit

struct MapView: UIViewRepresentable {
    var origin: CLLocationCoordinate2D
    var mapType: MKMapType
    var friends: [Friend]
    @Binding var selectedFriend: Friend?
    @Binding var showNavigationDetail: Bool
    var route: MKRoute?

    func makeUIView(context: Context) -> MKMapView {
        let mapView = MKMapView()
        mapView.delegate = context.coordinator
        mapView.showsUserLocation = true
        mapView.userTrackingMode = .follow
        return mapView
    }

    func updateUIView(_ mapView: MKMapView, context: Context) {
        mapView.mapType = mapType

        let annotations = friends.map { friend -> MKPointAnnotation in
            let annotation = MKPointAnnotation()
            annotation.title = friend.name
            annotation.coordinate = friend.location
            return annotation
        }
        mapView.addAnnotations(annotations)

        if let route = route {
            mapView.addOverlay(route.polyline)
            mapView.setVisibleMapRect(route.polyline.boundingMapRect, edgePadding: UIEdgeInsets(top: 100, left: 50, bottom: 100, right: 50), animated: true)
        }
    }

    func makeCoordinator() -> Coordinator {
        Coordinator(self, selectedFriend: $selectedFriend, showNavigationDetail: $showNavigationDetail)
    }

    class Coordinator: NSObject, MKMapViewDelegate {
        var parent: MapView
        @Binding var selectedFriend: Friend?
        @Binding var showNavigationDetail: Bool

        init(_ parent: MapView, selectedFriend: Binding<Friend?>, showNavigationDetail: Binding<Bool>) {
            self.parent = parent
            self._selectedFriend = selectedFriend
            self._showNavigationDetail = showNavigationDetail
        }

        func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
            if annotation is MKUserLocation {
                return nil
            }

            let identifier = "FriendAnnotation"
            var annotationView = mapView.dequeueReusableAnnotationView(withIdentifier: identifier) as? MKMarkerAnnotationView

            if annotationView == nil {
                annotationView = MKMarkerAnnotationView(annotation: annotation, reuseIdentifier: identifier)
                annotationView?.canShowCallout = true
                annotationView?.rightCalloutAccessoryView = UIButton(type: .detailDisclosure)
            } else {
                annotationView?.annotation = annotation
            }

            return annotationView
        }

        func mapView(_ mapView: MKMapView, annotationView view: MKAnnotationView, calloutAccessoryControlTapped control: UIControl) {
            if let annotation = view.annotation as? MKPointAnnotation {
                self.selectedFriend = parent.friends.first { $0.name == annotation.title }
                self.showNavigationDetail = true
            }
        }

        func mapView(_ mapView: MKMapView, rendererFor overlay: MKOverlay) -> MKOverlayRenderer {
            if let polyline = overlay as? MKPolyline {
                let renderer = MKPolylineRenderer(polyline: polyline)
                renderer.strokeColor = .blue
                renderer.lineWidth = 5
                return renderer
            }
            return MKOverlayRenderer(overlay: overlay)
        }
    }
}
