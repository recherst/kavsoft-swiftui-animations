//
//  MapViewModel.swift
//  AdvanceMapKitTutorial
//
//  Created by recherst on 2021/9/7.
//

import SwiftUI
import MapKit
import CoreLocation

class MapViewModel: NSObject, ObservableObject, CLLocationManagerDelegate {
    @Published var mapView = MKMapView()

    // Region
    @Published var region: MKCoordinateRegion!
    // Based on location it will set up

    // Alert
    @Published var permissionDenied = false

    @Published var mapType: MKMapType = .standard

    // Update map type
    func updateMapType() {
        if mapType == .standard {
            mapType = .hybrid
            mapView.mapType = mapType
        } else {
            mapType = .standard
            mapView.mapType = mapType
        }
    }

    // Focus location
    func focusLocation() {
        guard let _ = region else { return }
        mapView.setRegion(region, animated: true)
        mapView.setVisibleMapRect(mapView.visibleMapRect, animated: true)
    }

    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        // Check permissions
        switch manager.authorizationStatus {
        case .denied:
            // Alert
            permissionDenied.toggle()
        case .notDetermined:
            // Requesting
            manager.requestWhenInUseAuthorization()
        case .authorizedWhenInUse:
            // If permission given
            manager.requestLocation()
        default:
            print("")
        }
    }

    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print(error.localizedDescription)
    }

    // Get user region
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.last else { return }

        region = MKCoordinateRegion(center: location.coordinate, latitudinalMeters: 10000, longitudinalMeters: 10000)

        // Update map
        mapView.setRegion(region, animated: true)
        // Smooth animations
        mapView.setVisibleMapRect(mapView.visibleMapRect, animated: true)
    }
}
