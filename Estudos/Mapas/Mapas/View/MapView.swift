//
//  MapView.swift
//  Mapas
//
//  Created by Tales Seixas de Carvalho on 25/08/20.
//  Copyright © 2020 Tales Seixas de Carvalho. All rights reserved.
//

import SwiftUI
import MapKit


class Coordinator: NSObject, MKMapViewDelegate {
    var control: MapView
    
    init(_ control: MapView) {
        self.control = control
    }
    
    func mapView(_ mapView: MKMapView, didAdd views: [MKAnnotationView]) {
        if let annotationView = views.first {
            if let annotation = annotationView.annotation{
                if annotation is MKUserLocation{
                    
                    
                    let region = MKCoordinateRegion(center: annotation.coordinate, latitudinalMeters: 1000, longitudinalMeters: 1000)
                    mapView.setRegion(region, animated: true)
                    
                }
            }
        }
    }
    
}

struct MapView: UIViewRepresentable {
    
    let landmarks: [Landmark]
    
    
    func makeUIView(context: Context) -> MKMapView {
        let map = MKMapView()
        map.showsUserLocation = true
        map.delegate = context.coordinator
        return map
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    func updateUIView(_ uiView: MKMapView, context: UIViewRepresentableContext<MapView>) {
        updateAnnotation(from: uiView)
    }
    
    private func updateAnnotation(from mapView: MKMapView){
        mapView.removeAnnotation(mapView.annotations as! MKAnnotation)
        let annotations = self.landmarks.map(LandmarkAnnotation.init)
        mapView.addAnnotation(annotations as! MKAnnotation)
    }
    
    
    
}

