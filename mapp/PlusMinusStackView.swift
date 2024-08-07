//
//  PlusMinusStackView.swift
//  mapp
//
//  Created by utkarsh mishra on 07/08/24.
//

import Foundation
import SwiftUI
import MapKit
struct PlusMinusStackView: View {
    @Binding var mapView: MKMapView

    var body: some View {
        VStack(spacing: 0) {
            Button(action: {
                let region = mapView.region
                let span = MKCoordinateSpan(latitudeDelta: region.span.latitudeDelta / 2, longitudeDelta: region.span.longitudeDelta / 2)
                let newRegion = MKCoordinateRegion(center: region.center, span: span)
                mapView.setRegion(newRegion, animated: true)
            }) {
                Text("+")
                    .font(.system(size: 30, weight: .bold))
                    .frame(width: 15, height: 60)
                    .background(Color.white)
                    .foregroundColor(.black)
                    .cornerRadius(30, corners: [.topLeft, .topRight])
                    .overlay(RoundedRectangle(cornerRadius: 30)
                        .stroke(Color.white, lineWidth: 1))
            }
            
            Divider()
                .background(Color.gray)
                .frame(width: 60, height: 1)
            
            Button(action: {
                let region = mapView.region
                let span = MKCoordinateSpan(latitudeDelta: region.span.latitudeDelta * 2, longitudeDelta: region.span.longitudeDelta * 2)
                let newRegion = MKCoordinateRegion(center: region.center, span: span)
                mapView.setRegion(newRegion, animated: true)
            }) {
                Text("-")
                    .font(.system(size: 40, weight: .bold))
                    .frame(width: 15, height: 60)
                    .background(Color.white)
                    .foregroundColor(.black)
                    .cornerRadius(30, corners: [.bottomLeft, .bottomRight])
                    .overlay(RoundedRectangle(cornerRadius: 30)
                        .stroke(Color.white, lineWidth: 1))
            }
        }
        .background(Color.white)
        .cornerRadius(30)
        .shadow(radius: 5)
        .padding()
    }
}

struct RoundedCorner: Shape {
    var radius: CGFloat = .infinity
    var corners: UIRectCorner = .allCorners

    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        return Path(path.cgPath)
    }
}

extension View {
    func cornerRadius(_ radius: CGFloat, corners: UIRectCorner) -> some View {
        clipShape(RoundedCorner(radius: radius, corners: corners))
    }
}
