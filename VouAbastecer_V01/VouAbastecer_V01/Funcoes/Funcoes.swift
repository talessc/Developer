//
//  Funcoes.swift
//  VouAbastecer_V01
//
//  Created by Tales Carvalho on 18/10/23.
//

import Foundation
import SwiftUI
import Combine


class Funcoes: ObservableObject {
    
@Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
@EnvironmentObject var dadosCadastrados: DadosCadastrados
@EnvironmentObject var dadosCalculados: DadosCalculados

@State private var preçoDoCombustível = ""
@State private var litrosAbastecidos = ""
@State private var quilometragemAtual = ""
@State private var preçoTotalDaAbastecida = ""

@State private var gasolinaPrecoDoCombustivel = ""
@State private var alcoolPrecoDoCombustivel = ""
@State private var gasolinaLitrosAbastecida = ""
@State private var alcoolLitrosAbastecida = ""
@State private var gasolinaPrecoTotalDaAbastecida = ""
@State private var alcoolPrecoTotalDaAbastecida = ""



@State private var preçoDoCombustívelArray = [String]()
@State private var litrosAbastecidosArray = [String]()
@State private var quilometragemAtualArray = [String]()
@State private var preçoTotalDaAbastecidaArray = [String]()
@State private var mediaArray = [Double]()
@State private var quilometragemTotalArray = [Double]()

@State private var gasolinaPrecoDoCombustivelArray = [String]()
@State private var alcoolPrecoDoCombustivelArray = [String]()
@State private var gasolinaLitrosAbastecidaArray = [String]()
@State private var alcoolLitrosAbastecidaArray = [String]()
@State private var gasolinaQuilometragemAtualArray = [String]()
@State private var alcoolQuilometragemAtualArray = [String]()
@State private var gasolinaPrecoTotalDaAbastecidaArray = [String]()
@State private var alcoolPrecoTotalDaAbastecidaArray = [String]()
@State private var gasolinaMediaArray = [Double]()
@State private var alcoolMediaArray = [Double]()
@State private var gasolinaDiasRodadosArray = [Int]()
@State private var alcoolDiasRodadosArray = [Int]()



@State private var quilometragemTotal = 0.0
@State private var showAlert = false
@State private var alertTitle = ""
@State private var alertMessage = ""

@State private var isLinkActive = false

@State private var showValidationError = false

@State private var tipoDeCombustivel = "Gasolina"
    
    
    func validateQuilometragem() {
        if let lastKm = Double(dadosCadastrados.quilometragemAtualArray.last ?? ""),
           let currentKm = Double(quilometragemAtual),
           currentKm <= lastKm {
               showValidationError = true
        }
    }
    
   func calculateTotal() {
        if let preço = Double(preçoDoCombustível), let litros = Double(litrosAbastecidos) {
            let total = preço * litros
            preçoTotalDaAbastecida = String(format: "%.2f", total)
        }
    }
    
    func salvar() {
        dadosCadastrados.preçoDoCombustívelArray.append(preçoDoCombustível)
        dadosCadastrados.litrosAbastecidosArray.append(litrosAbastecidos)
      
        
        if let últimaData = dadosCadastrados.datasDeCadastroArray.last {
                let diferença = Date().timeIntervalSince(últimaData)
            }
            dadosCadastrados.datasDeCadastroArray.append(Date())
        
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        formatter.timeStyle = .medium

        for index in 1..<dadosCadastrados.datasDeCadastroArray.count {
            let previousDate = dadosCadastrados.datasDeCadastroArray[index - 1]
            let currentDate = dadosCadastrados.datasDeCadastroArray[index]

            let diffComponents = Calendar.current.dateComponents([.day], from: previousDate, to: currentDate)
            let daysDifference = diffComponents.day ?? 0

            print("Data de Cadastramento anterior: \(formatter.string(from: previousDate))")
            print("Data de Cadastramento atual: \(formatter.string(from: currentDate))")
            print("Diferença em dias: \(daysDifference) dias")
        }

        
        if dadosCadastrados.datasDeCadastroArray.count >= 2 {
            let lastIndex = dadosCadastrados.datasDeCadastroArray.count - 1
            let previousDate = dadosCadastrados.datasDeCadastroArray[lastIndex - 1]
            let currentDate = dadosCadastrados.datasDeCadastroArray[lastIndex]
            
            let diffComponents = Calendar.current.dateComponents([.day], from: previousDate, to: currentDate)
            let daysDifference = diffComponents.day ?? 0
            dadosCalculados.diferencaEntreDatas.append(daysDifference)
        }

        print("Diferenças entre datas cadastradas (em dias): \(dadosCalculados.diferencaEntreDatas)")

        
        var penultimoQuilometragem: Double?
        
        if let ultimoQuilometragem = Double(dadosCadastrados.quilometragemAtualArray.last ?? "\(0)"),
           let quilometragemAtualDouble = Double(quilometragemAtual) {
            let distancia = quilometragemAtualDouble - ultimoQuilometragem
            dadosCadastrados.ultimaDistanciaArray.append(distancia)
        }

        
        
        if dadosCadastrados.quilometragemAtualArray.isEmpty {
                // Primeiro dado, apenas armazene
                dadosCadastrados.quilometragemAtualArray.append(quilometragemAtual)
            
            print("dadosCadastrados.quilometragemAtualArray - primeira entrada \(dadosCadastrados.quilometragemAtualArray)")
            } else if dadosCadastrados.quilometragemAtualArray.count == 1 {
                // Segundo dado, faça o cálculo utilizando o primeiro elemento
                if let primeiroQuilometragem = Double(dadosCadastrados.quilometragemAtualArray.last!),
                   let quilometragemAtualDouble = Double(quilometragemAtual),
                   let litrosAbastecidosDouble = Double(litrosAbastecidos) {
                    let media = (quilometragemAtualDouble - primeiroQuilometragem) / litrosAbastecidosDouble
                    print("dadosCadastrados.quilometragemAtualArray - segunda entrada \(dadosCadastrados.quilometragemAtualArray)")
                }
                dadosCadastrados.quilometragemAtualArray.append(quilometragemAtual)
            } else {
                // Terceiro dado em diante, use a lógica que você já tem (com o penúltimo valor)
                let penultimoQuilometragemString = dadosCadastrados.quilometragemAtualArray[dadosCadastrados.quilometragemAtualArray.count - 2]
                if let penultimoQuilometragem = Double(penultimoQuilometragemString),
                   let quilometragemAtualDouble = Double(quilometragemAtual),
                   let litrosAbastecidosDouble = Double(litrosAbastecidos) {
                    let media = (quilometragemAtualDouble - penultimoQuilometragem) / litrosAbastecidosDouble
                    //dadosCalculados.mediaArray.append(media)
                    print("dadosCadastrados.quilometragemAtualArray - terceira entrada \(dadosCadastrados.quilometragemAtualArray)")
                }
                dadosCadastrados.quilometragemAtualArray.append(quilometragemAtual)
            }
        
        
        var media = 0.0

   
            if let distanciaPercorrida = dadosCadastrados.ultimaDistanciaArray.last, let litrosAbastecidosDouble = Double(litrosAbastecidos) {
                media = distanciaPercorrida / litrosAbastecidosDouble
                let formattedMedia = Double(String(format: "%.2f", media)) ?? 0.0
                dadosCalculados.mediaArray.append(formattedMedia)
            }

            if let quilometragemAtualDouble = Double(quilometragemAtual) {
                dadosCalculados.quilometragemTotalArray.append(quilometragemAtualDouble)
            }
        
        
        dadosCalculados.quilometragemTotalArray.append(quilometragemTotal)
        print("Setting showAlert to true")
        dadosCalculados.preçoTotalDaAbastecidaArray.append(preçoTotalDaAbastecida)
        
        
        alertTitle = "Dados salvos"
        alertMessage = "Última média: \(String(format: "%.2f", media))"
        showAlert = true
        
        
        preçoDoCombustível = ""
        litrosAbastecidos = ""
        quilometragemAtual = ""
        preçoTotalDaAbastecida = ""
        
        
        print("preçoDoCombustívelArray: \(dadosCadastrados.preçoDoCombustívelArray)")
        print("litrosAbastecidosArray: \(dadosCadastrados.litrosAbastecidosArray)")
        print("quilometragemAtualArray: \(dadosCadastrados.quilometragemAtualArray)")
        print("****preçoTotalDaAbastecidaArray***: \(dadosCalculados.preçoTotalDaAbastecidaArray)")
        print("mediaArray: \(dadosCalculados.mediaArray)")
        print("quilometragemTotalArray: \(dadosCalculados.quilometragemTotalArray)")
        print("media: \(media)")
        print("Array quilometragemAtualArray: \(dadosCadastrados.quilometragemAtualArray)")
        print("Array UltimaDistancia \(dadosCadastrados.ultimaDistanciaArray)")
        
        let encoder = JSONEncoder()
            if let encodedDadosCadastrados = try? encoder.encode(dadosCadastrados) {
                UserDefaults.standard.set(encodedDadosCadastrados, forKey: "DadosCadastrados")
            }
            
            if let encodedDadosCalculados = try? encoder.encode(dadosCalculados) {
                UserDefaults.standard.set(encodedDadosCalculados, forKey: "DadosCalculados")
            }
    }
    func calcularDiasRodados() {
        var dataUltimaAbastecida = 0
    }
}
