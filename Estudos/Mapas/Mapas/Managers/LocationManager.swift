//
//  LocationManager.swift
//  Mapas
//
//  Created by Tales Seixas de Carvalho on 25/08/20.
//  Copyright © 2020 Tales Seixas de Carvalho. All rights reserved.
//

import SwiftUI
import MapKit

class LocationManager: NSObject, ObservableObject{
    
    private let locationManager = CLLocationManager()
   @Published var location: CLLocation? = nil
    
    override init() {
        super.init()
        self.locationManager.delegate = self
        self.locationManager.desiredAccuracy = kCLLocationAccuracyBest
        self.locationManager.distanceFilter = kCLDistanceFilterNone
        self.locationManager.requestWhenInUseAuthorization()
        self.locationManager.startUpdatingLocation()
    }
    
    
}

extension LocationManager: CLLocationManagerDelegate {
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        print(status)
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.last else {return}
        
        self.location = location
        
    }
    
    
}
