//
//  Place.swift
//  mapp
//
//  Created by utkarsh mishra on 07/08/24.
//


import Foundation

struct OverpassResult: Decodable {
    struct Element: Decodable {
        let id: Int
        let lat: Double
        let lon: Double
        let tags: Tags?
        
        struct Tags: Decodable {
            let name: String?
        }
    }
    
    let elements: [Element]
}

struct Place: Identifiable {
    let id = UUID()
    let name: String
    let latitude: Double
    let longitude: Double
}
