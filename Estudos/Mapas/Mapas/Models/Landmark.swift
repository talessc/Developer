//
//  Landmark.swift
//  Mapas
//
//  Created by Tales Seixas de Carvalho on 25/08/20.
//  Copyright © 2020 Tales Seixas de Carvalho. All rights reserved.
//

import Foundation
import MapKit


struct Landmark {
    
    let placemark: MKPlacemark
    
    var id: UUID {
        return UUID()
    }
    
    var name: String {
        self.placemark.name ?? ""
        
    }
    
    var title: String {
        self.placemark.title ?? ""
    }
    var coordinate: CLLocationCoordinate2D {
        self.placemark.coordinate
    }
}
