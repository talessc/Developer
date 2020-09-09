//
//  LandmarkAnnotaion.swift
//  Mapas
//
//  Created by Tales Seixas de Carvalho on 25/08/20.
//  Copyright © 2020 Tales Seixas de Carvalho. All rights reserved.
//

import UIKit
import MapKit

final class LandmarkAnnotation: NSObject, MKAnnotation{
    let title: String?
    let coordinate: CLLocationCoordinate2D
    
    init(landmark: Landmark) {
        self.title = landmark.name
        self.coordinate = landmark.coordinate
    }
    
}
