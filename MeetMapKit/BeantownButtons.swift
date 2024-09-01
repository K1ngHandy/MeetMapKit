//
//  BeanTownButtons.swift
//  MeetMapKit
//
//  Created by Steve Handy on 2024.08.31.
//

//import Foundation
import SwiftUI

var body: some View {
    @Binding var searchResults: [MKMapItem]
    
    func search(for query: String) {
        let request = MKLocalSearch.Request()
        request.naturalLanguageQuery = query
        request.resultTypes = .pointOfInterest
        request.region = MKCoordinateRegion(
            center: .parking,
            span: MKCoordinateSpan(latitudeDelta: 0.0125, longitudeDelta: 0.0125))
        
        Task {
            let search = MKLocalSearch(request: request)
            let response = try? await search.start()
            searchResults = response?.mapItems ?? []
        }
    }
    
    HStack {
        Button {
            search(for: "playground")
        } label: {
            Label("Playgrounds", systemImage: "figure.and.child.holdinghands")
        }
        .buttonStyle(.borderedProminent)
        
        Button {
            search(for: "beach")
        } label: {
            Label("Beaches", systemImage: "beach.umbrella")
        }
        .buttonStyle(.borderedProminent)
    }
    .labelStyle(.iconOnly)
}
