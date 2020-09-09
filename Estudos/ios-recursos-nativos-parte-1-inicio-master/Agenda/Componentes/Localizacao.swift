//
//  Localizacao.swift
//  Agenda
//
//  Created by Tales Seixas de Carvalho on 18/08/20.
//  Copyright © 2020 Alura. All rights reserved.
//

import UIKit
import CoreLocation
class Localizacao: NSObject {
    
    func converteEnderecoEmCoordenadas(endereco: String, local:@escaping(_ local: CLPlacemark)-> Void){
        let conversor = CLGeocoder()
        
        conversor.geocodeAddressString(endereco) { (listaDeLocalizacoes, error) in
            if let localizacao = listaDeLocalizacoes?.first{
                local(localizacao)
            }
        }
        
        
    }
    
    

}
