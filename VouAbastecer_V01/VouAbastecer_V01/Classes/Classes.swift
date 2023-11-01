//
//  Classes.swift
//  VouAbastecer_V01
//
//  Created by Tales Carvalho on 18/10/23.
//

import Foundation
import SwiftUI
import Combine

class DadosCadastrados: ObservableObject, Codable {
    @Published var preçoDoCombustívelArray = [String]()
    @Published var litrosAbastecidosArray = [String]()
    @Published var quilometragemAtualArray = [String]()
    @Published var ultimaDistanciaArray = [Double]()
    @Published var datasDeCadastroArray = [Date]()
    
    @Published var gasolinaPrecoDoCombustivel = [String]()
    @Published var alcoolPrecoDoCombustivel = [String]()
    
    
    enum CodingKeys: String, CodingKey {
        case preçoDoCombustívelArray
        case litrosAbastecidosArray
        case quilometragemAtualArray
        case ultimaDistanciaArray
        case datasDeCadastroArray
        
        case gasolinaPrecoDoCombustivel
        case alcoolPrecoDoCombustivel
    }

    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        preçoDoCombustívelArray = try container.decode([String].self, forKey: .preçoDoCombustívelArray)
        litrosAbastecidosArray = try container.decode([String].self, forKey: .litrosAbastecidosArray)
        quilometragemAtualArray = try container.decode([String].self, forKey: .quilometragemAtualArray)
        ultimaDistanciaArray = try container.decode([Double].self, forKey: .ultimaDistanciaArray)
        datasDeCadastroArray = try container.decode([Date].self, forKey: .datasDeCadastroArray)
       
        gasolinaPrecoDoCombustivel = try container.decode([String].self, forKey: .gasolinaPrecoDoCombustivel)
        alcoolPrecoDoCombustivel = try container.decode([String].self, forKey: .alcoolPrecoDoCombustivel)
    }

    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(preçoDoCombustívelArray, forKey: .preçoDoCombustívelArray)
        try container.encode(litrosAbastecidosArray, forKey: .litrosAbastecidosArray)
        try container.encode(quilometragemAtualArray, forKey: .quilometragemAtualArray)
        try container.encode(ultimaDistanciaArray, forKey: .ultimaDistanciaArray)
        try container.encode(datasDeCadastroArray, forKey: .datasDeCadastroArray)
        
        try container.encode(gasolinaPrecoDoCombustivel, forKey: .gasolinaPrecoDoCombustivel)
        try container.encode(alcoolPrecoDoCombustivel, forKey: .alcoolPrecoDoCombustivel)
    }

    init() {
        if let savedData = UserDefaults.standard.data(forKey: "dadosCadastrados") {
            let decoder = JSONDecoder()
            if let loadedData = try? decoder.decode(DadosCadastrados.self, from: savedData) {
                self.preçoDoCombustívelArray = loadedData.preçoDoCombustívelArray
                self.litrosAbastecidosArray = loadedData.litrosAbastecidosArray
                self.quilometragemAtualArray = loadedData.quilometragemAtualArray
                
                self.gasolinaPrecoDoCombustivel = loadedData.gasolinaPrecoDoCombustivel
                self.alcoolPrecoDoCombustivel = loadedData.alcoolPrecoDoCombustivel
            }
        }
    }
}

class DadosCalculados: ObservableObject, Codable {
    @Published var mediaArray = [Double]()
    @Published var quilometragemTotalArray = [Double]()
    @Published var diferencaEntreDatas: [Int] = []
    @Published var preçoTotalDaAbastecidaArray = [String]()
    
    @Published var gasolinaMediaArray = [Double]()
    @Published var alcoolMediaArray = [Double]()
    @Published var gasolinaQuilometragemTotalArray = [Double]()
    @Published var alcoolQuilometragemTotalArray = [Double]()
    @Published var gasolinaPrecoDaAbastecidaArray = [String]()
    @Published var alcoolPrecoDaAbastecidaArray = [String]()
    @Published var gasolinaDiasRodadosArray = [Int]()
    @Published var alcoolDiasRodadosArray = [Int]()
    
    /*
     Como fazer para que a diferença de datas de abastecimento possam ser comparadas:
     - Problema: Terei uma data de abastecimento de Gasolina Ex: 10 dias, Abasteço com Alcool e terei uma data registrada como Abastecido com alcool ex 12 dias.
     - Pergunta pra responder: Como fazer para que mostre a diferença das duas datas?
    * Solução - usar sempre a data da última abastecida. - Informação: deste a última abasteceida ddo combustivel X foram tantos dias. ( AlcoolPrecoArray [ dia 1 ] , GasolinaPrecoArray [dia 20] - informação apresentada: 19 dias  que o carro rodou com Alcool)
     * continuando - (AlcoolPrecoArray [dia 1, dia 30], gasolinaPrecoArray [dia 20] - informação apresentada: 10 dias que o carro rodou com Gasolina.
     * Não precisa ter ter diferença de AlcooPrecoArray e gasolinaPrecoArray. Precisamos somente da data da última abastecida e da que esta sendo cadastrada no momento. E precisa da informação de que combustível foi utilizado por último.
     * Precisa guargar a informação último perídodo rodado e o combustivel usado. criar uma Array com esses dados. AlccolDias [19, 10], GasolinaDias [10]
     
     
     */
    
    enum CodingKeys: String, CodingKey {
        case mediaArray
        case quilometragemTotalArray
        case diferencaEntreDatas
        case preçoTotalDaAbastecidaArray
        
        case gasolinaMediaArray
        case alcoolMediaArray
        case gasolinaQuilometragemTotalArray
        case alcoolQuilometragemTotalArray
        case gasolinaPrecoDaAbastecidaArray
        case alcoolPrecoDaAbastecidaArray
        case gasolinaDiasRodadosArray
        case alcoolDiasRodadosArray
    }

    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        mediaArray = try container.decode([Double].self, forKey: .mediaArray)
        quilometragemTotalArray = try container.decode([Double].self, forKey: .quilometragemTotalArray)
        diferencaEntreDatas = try container.decode([Int].self, forKey: .diferencaEntreDatas)
        preçoTotalDaAbastecidaArray = try container.decode([String].self, forKey: .preçoTotalDaAbastecidaArray)
        
        gasolinaMediaArray = try container.decode([Double].self, forKey: .gasolinaMediaArray)
        alcoolMediaArray = try container.decode([Double].self, forKey: .alcoolMediaArray)
        gasolinaQuilometragemTotalArray = try container.decode([Double].self, forKey: .gasolinaQuilometragemTotalArray)
        alcoolQuilometragemTotalArray = try container.decode([Double].self, forKey: .alcoolQuilometragemTotalArray)
        gasolinaPrecoDaAbastecidaArray = try container.decode([String].self, forKey: .gasolinaPrecoDaAbastecidaArray)
        alcoolPrecoDaAbastecidaArray = try container.decode([String].self, forKey: .alcoolPrecoDaAbastecidaArray)
        gasolinaDiasRodadosArray = try container.decode([Int].self, forKey: .gasolinaDiasRodadosArray)
        alcoolDiasRodadosArray = try container.decode([Int].self, forKey: .alcoolDiasRodadosArray)
    }

    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(mediaArray, forKey: .mediaArray)
        try container.encode(quilometragemTotalArray, forKey: .quilometragemTotalArray)
        try container.encode(diferencaEntreDatas, forKey: .diferencaEntreDatas)
        try container.encode(preçoTotalDaAbastecidaArray, forKey: .preçoTotalDaAbastecidaArray)
        
        try container.encode(gasolinaMediaArray, forKey: .gasolinaMediaArray)
        try container.encode(alcoolMediaArray, forKey: .alcoolMediaArray)
        try container.encode(gasolinaQuilometragemTotalArray, forKey: .gasolinaQuilometragemTotalArray)
        try container.encode(alcoolQuilometragemTotalArray, forKey: .alcoolQuilometragemTotalArray)
        try container.encode(gasolinaPrecoDaAbastecidaArray, forKey: .gasolinaPrecoDaAbastecidaArray)
        try container.encode(alcoolPrecoDaAbastecidaArray, forKey: .alcoolPrecoDaAbastecidaArray)
        try container.encode(gasolinaDiasRodadosArray, forKey: .gasolinaDiasRodadosArray)
        try container.encode(alcoolDiasRodadosArray, forKey: .alcoolDiasRodadosArray)
        
    }

    init() {
        if let savedData = UserDefaults.standard.data(forKey: "dadosCalculados") {
            let decoder = JSONDecoder()
            if let loadedData = try? decoder.decode(DadosCalculados.self, from: savedData) {
                self.mediaArray = loadedData.mediaArray
                self.quilometragemTotalArray = loadedData.quilometragemTotalArray
                self.diferencaEntreDatas = loadedData.diferencaEntreDatas
                self.preçoTotalDaAbastecidaArray = loadedData.preçoTotalDaAbastecidaArray
                
                self.gasolinaMediaArray = loadedData.gasolinaMediaArray
                self.alcoolMediaArray = loadedData.alcoolMediaArray
                self.gasolinaQuilometragemTotalArray = loadedData.gasolinaQuilometragemTotalArray
                self.alcoolQuilometragemTotalArray = loadedData.alcoolQuilometragemTotalArray
                self.gasolinaPrecoDaAbastecidaArray = loadedData.gasolinaPrecoDaAbastecidaArray
                self.alcoolPrecoDaAbastecidaArray = loadedData.alcoolPrecoDaAbastecidaArray
                self.gasolinaDiasRodadosArray = loadedData.gasolinaDiasRodadosArray
                self.alcoolDiasRodadosArray = loadedData.alcoolDiasRodadosArray
            }
        }
    }
}
