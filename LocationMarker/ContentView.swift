//
//  ContentView.swift
//  LocationMarker
//
//  Created by Work on 15/9/24.
//

import SwiftUI
import MapKit

struct ContentView: View {
    
    let array: [Location] = [
        .init(coor: .weequahicPark),
        .init(coor: .empireStateBuilding),
        .init(coor: .columbiaUniversity)
    ]
    
    @State private var selectedTag: String?
    
    var body: some View {
        Map(selection: $selectedTag) {
            ForEach(array) { item in
                Marker("Empire state building", coordinate: item.coor)
                    .tint(.orange)
                    .tag(item.id)
            }
  
        }
        .onChange(of: selectedTag) { oldValue, newValue in
            print("--- debug --- newValue = ", newValue)
        }
    }
}

extension CLLocationCoordinate2D {
    static let weequahicPark = CLLocationCoordinate2D(latitude: 40.7063, longitude: -74.1973)
    static let empireStateBuilding = CLLocationCoordinate2D(latitude: 40.7484, longitude: -73.9857)
    static let columbiaUniversity = CLLocationCoordinate2D(latitude: 40.8075, longitude: -73.9626)
}


#Preview {
    ContentView()
}
struct Location: Identifiable {
    let id = UUID().uuidString
    let coor: CLLocationCoordinate2D
}
