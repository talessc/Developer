//
//  ContentView.swift
//  Mapas
//
//  Created by Tales Seixas de Carvalho on 25/08/20.
//  Copyright © 2020 Tales Seixas de Carvalho. All rights reserved.
//

import SwiftUI
import MapKit

struct ContentView: View {
    
    @ObservedObject var locationManager = LocationManager()
    @State private var landmarks:[Landmark] = [Landmark]()
    @State private var search: String = ""
    
    private func getNearByLandmarks(){
        
        let request = MKLocalSearch.Request()
        request.naturalLanguageQuery = search
        
        let search = MKLocalSearch(request: request)
        search.start { (response, error) in
            if let response = response {
                let mapItens = response.mapItems
                self.landmarks = mapItens.map {
                    Landmark(placemark: $0.placemark)
                }
            }
        }
    }
    
    var body: some View {
        ZStack(alignment: .top){
            MapView(landmarks: landmarks)
            .edgesIgnoringSafeArea(.all)
            
            TextField("Procurar", text: $search, onEditingChanged: { _ in})
            {
                self.getNearByLandmarks()
            }.textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
                .offset(y: 44)
            
            

        }
       
        
    }
}






struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
