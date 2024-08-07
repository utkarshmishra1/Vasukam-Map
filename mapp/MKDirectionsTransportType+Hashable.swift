//
//  MKDirectionsTransportType+Hashable.swift
//  mapp
//
//  Created by utkarsh mishra on 05/08/24.
//

import Foundation
import MapKit

extension MKDirectionsTransportType: Hashable {
    public static func == (lhs: MKDirectionsTransportType, rhs: MKDirectionsTransportType) -> Bool {
        lhs.rawValue == rhs.rawValue
    }
    
    public func hash(into hasher: inout Hasher) {
        hasher.combine(rawValue)
    }
}
