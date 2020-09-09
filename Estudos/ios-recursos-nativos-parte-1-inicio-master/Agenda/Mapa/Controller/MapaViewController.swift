//
//  MapaViewController.swift
//  Agenda
//
//  Created by Tales Seixas de Carvalho on 18/08/20.
//  Copyright © 2020 Alura. All rights reserved.
//

import UIKit
import MapKit

class MapaViewController: UIViewController {
    
    //MARK:- IBOutlet
    
    @IBOutlet weak var mapa: MKMapView!
    
    
    //MARK: - Variável
    var aluno: Aluno?
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.title = self.getTitulo()
        self.localizacaoInicial()
        self.localizarAluno()
        
    
    }
    
    //MARK: - Métodos
    
    func configuraPino (titulo: String, localizacao: CLPlacemark) -> MKPointAnnotation {
        let pino = MKPointAnnotation()
        
        pino.title = titulo
        pino.coordinate = localizacao.location?.coordinate as! CLLocationCoordinate2D
        
        return pino
    }
    
    func getTitulo() -> String {
        return "Localizar Aluno"
        
    }
    
    func localizacaoInicial (){
        Localizacao().converteEnderecoEmCoordenadas(endereco: "Caelum - São Paulo") { (localizacaoEncontrada) in
            let pino = self.configuraPino(titulo: "Caelum", localizacao: localizacaoEncontrada)
            
            let regiao = MKCoordinateRegionMakeWithDistance(pino.coordinate, 5000, 5000)
            self.mapa.setRegion(regiao, animated: true)
            self.mapa.addAnnotation(pino)
        }
        
    }

    func localizarAluno(){
        if let aluno = aluno {
            Localizacao().converteEnderecoEmCoordenadas(endereco: aluno.endereco!) { (localizacaoEncontrada) in
                let pino = self.configuraPino(titulo: aluno.nome!, localizacao: localizacaoEncontrada)
                self.mapa.addAnnotation(pino)
            }
    }
    }
    

}
