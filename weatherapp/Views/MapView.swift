//
//  MapView.swift
//  weatherapp
//
//  Created by Felix Boquet on 16/10/2019.
//  Copyright © 2019 Felix Boquet. All rights reserved.
//

import SwiftUI
import MapKit

@available(iOS 13.0.0, *)
struct MapView: UIViewRepresentable {

    func updateUIView(_ view: MKMapView, context: Context) {
        let coordinate = CLLocationCoordinate2D(latitude: 34.011286, longitude: -116.166868)
        let span = MKCoordinateSpan(latitudeDelta: 2.0, longitudeDelta: 2.0)
        let region = MKCoordinateRegion(center: coordinate, span: span)
        view.setRegion(region, animated: true)
    }

    func makeUIView(context: Context) -> MKMapView {
        MKMapView(frame: .zero)
    }
}

@available(iOS 13.0.0, *)
struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView()
    }
}
