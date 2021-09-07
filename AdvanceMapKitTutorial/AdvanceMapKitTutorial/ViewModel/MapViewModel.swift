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

    // SearchText
    @Published var searchText = ""

    // Searched places
    @Published var places: [Place] = []
    

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

    // Search places
    func searchQuery() {
        let request = MKLocalSearch.Request()
        request.naturalLanguageQuery = searchText
        // Fetch
        MKLocalSearch(request: request).start { response, _ in
            guard let result = response else { return }
            self.places = result.mapItems.compactMap { Place(placemark: $0.placemark) }
        }
    }

    // Pick search result
    func selectPlace(place: Place) {
        // Show pin on map
        searchText = ""

        guard let coordinate = place.placemark.location?.coordinate else { return }

        let pointAnnotation = MKPointAnnotation()
        pointAnnotation.coordinate = coordinate
        pointAnnotation.title = place.placemark.name ?? "No Name"
        // Remove all old ones
        mapView.removeAnnotations(mapView.annotations)

        mapView.addAnnotation(pointAnnotation)

        // Move map to that location
        let corrdinateRegion = MKCoordinateRegion(center: coordinate, latitudinalMeters: 10000, longitudinalMeters: 10000)
        mapView.setRegion(corrdinateRegion, animated: true)
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
