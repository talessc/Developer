//
//  OutroRetanguloView..swift
//  VouAbastecer_V01
//
//  Created by Tales Carvalho on 20/10/23.
//

import SwiftUI
import Combine

//class DadosParaTelaPrincipal: ObservableObject {
//    @Published var maxDado: Double = 0.0
//    @Published var atualDado: Double = 0.0
//    @Published var minDado: Double = 0.0
//}

struct OutroRetanguloView: View {
    @EnvironmentObject var dadosCadastrados: DadosCadastrados
    @EnvironmentObject var dadosCalculados: DadosCalculados
    
    var printData: Void {
        //print("bla bla bla MAX \(dadosCalculados.preçoTotalDaAbastecidaArray.max())")
        //print("bla bla bla LAST \(dadosCalculados.preçoTotalDaAbastecidaArray.last)")
        //print("bla bla bla MIN \(dadosCalculados.preçoTotalDaAbastecidaArray.min())")
           return ()
       }
    
    var body: some View {
        
        _ = printData
        
       return VStack(spacing: 0) {
            
          
            
            HStack{
                VStack(spacing: 0){
                    RetanguloFotos()
                        .offset(x: -16, y: -16)
                        .padding()
                    Text("Foto")
                        .foregroundColor(Color(red: 0xF6/255, green: 0xF6/255, blue: 0xC8/255))
                }
                VStack(spacing: 0){
                    TesteView(maxTextAlcool: String(format: "%.1f", dadosCalculados.mediaArray.max() ?? 0.0),
                              atualTextAlcool: String(format: "%.1f", dadosCalculados.mediaArray.last ?? 0.0),
                              minTextAlcool: String(format: "%.1f", dadosCalculados.mediaArray.min() ?? 0.0),
                              maxTextGasolina: "102",
                              atualTextGasolina: "152",
                              minTextGasolina: "202")
                    Text("Melhor Opção")
                        .foregroundColor(Color(red: 0xF6/255, green: 0xF6/255, blue: 0xC8/255))
                }
            }
            HStack{
                VStack(spacing: 0){
                    TesteView(
                        maxTextAlcool: String(format: "%.1f", dadosCadastrados.ultimaDistanciaArray.max() ?? 0.0),
                        atualTextAlcool: String(format: "%.1f", dadosCadastrados.ultimaDistanciaArray.last ?? 0.0),
                        minTextAlcool: String(format: "%.1f", dadosCadastrados.ultimaDistanciaArray.min() ?? 0.0),
                              maxTextGasolina: "502",
                              atualTextGasolina: "302",
                              minTextGasolina: "202")
                    Text("Km Rodados")
                        .foregroundColor(Color(red: 0xF6/255, green: 0xF6/255, blue: 0xC8/255))
                }
                VStack(spacing: 0){
                    TesteView(
                        maxTextAlcool: String(format: "%.f", dadosCalculados.diferencaEntreDatas.max() ?? 0),
                        atualTextAlcool: String(format: "%.f", dadosCalculados.diferencaEntreDatas.last ?? 0),
                        minTextAlcool: String(format: "%.f", dadosCalculados.diferencaEntreDatas.min() ?? 0),
                        maxTextGasolina: "32",
                        atualTextGasolina: "22",
                        minTextGasolina: "12")
                    Text("Dias")
                        .foregroundColor(Color(red: 0xF6/255, green: 0xF6/255, blue: 0xC8/255))
                }
                
            }
            HStack{
                VStack(spacing: 0){
                    TesteView(
                        maxTextAlcool: String(format: "%.1f", dadosCadastrados.ultimaDistanciaArray.max() ?? 0.0),
                        atualTextAlcool: String(format: "%.1f", dadosCadastrados.ultimaDistanciaArray.last ?? 0.0),
                        minTextAlcool: String(format: "%.1f", dadosCadastrados.ultimaDistanciaArray.min() ?? 0.0),
                              maxTextGasolina: "502",
                              atualTextGasolina: "302",
                              minTextGasolina: "202")
                    Text("Médias")
                        .foregroundColor(Color(red: 0xF6/255, green: 0xF6/255, blue: 0xC8/255))
                }
                VStack(spacing: 0){
                    
                    TesteView(
                        
                        maxTextAlcool: String(format: "%.2f", dadosCalculados.preçoTotalDaAbastecidaArray.max() ?? 0.0),
                        atualTextAlcool: String(format: "%.2f", dadosCalculados.preçoTotalDaAbastecidaArray.last ?? 9.0),
                        minTextAlcool: String(format: "%.2f", dadosCalculados.preçoTotalDaAbastecidaArray.min() ?? 0.0),
                        maxTextGasolina: "302",
                        atualTextGasolina: "202",
                        minTextGasolina: "102")
                    
                    Text("Custo")
                        .foregroundColor(Color(red: 0xF6/255, green: 0xF6/255, blue: 0xC8/255))
                }
                
            }
        }
    }
    
}


struct TesteView: View {
   // @EnvironmentObject var dados: DadosParaTelaPrincipal
    @EnvironmentObject var dadosCadastrados: DadosCadastrados
    @EnvironmentObject var dadosCalculados: DadosCalculados
    
    var maxTextAlcool: String
    var atualTextAlcool: String
    var minTextAlcool: String
    
    var maxTextGasolina: String
    var atualTextGasolina: String
    var minTextGasolina: String
    
    
    var body: some View {
        HStack(spacing: 0){
            ZStack{
                GeometryReader { geometry in
                    
                    Rectangle()
                        .foregroundColor(Color(red: 0x4F/255, green: 0x9F/255, blue: 0x94/255))
                        .cornerRadius(10)
                        .frame(width: geometry.size.width / 1, height: geometry.size.height)
                    VStack(spacing: 0){
                        VStack{
                            ZStack{
                                Text(maxTextAlcool)
                                    .font(.subheadline)
                                    .frame(width: geometry.size.width / 1, height: geometry.size.height / 3)
                                    .minimumScaleFactor(0.5)
                                    .lineLimit(1)
                                Text("max")
                                    .font(.caption2)
                                    .offset(y: 10)
                            }
                        }
                        ZStack{
                            Text(atualTextAlcool)
                                .font(.largeTitle)
                                .frame(width: geometry.size.width / 1, height: geometry.size.height / 3)
                                .minimumScaleFactor(0.5)
                                .lineLimit(1)
                            Text("atual")
                                .font(.footnote)
                                .offset(y: 20)
                        }
                        ZStack{
                            Text(minTextAlcool)
                                .font(.subheadline)
                                .frame(width: geometry.size.width / 1, height: geometry.size.height / 3)
                                .minimumScaleFactor(0.5)
                                .lineLimit(1)
                            Text("min")
                                .font(.caption2)
                                .offset(y: 10)
                        }
                        
                    }
                }
            }
            ZStack{
                GeometryReader { geometry in
                    
                    Rectangle()
                        .foregroundColor(Color(red: 0xB9/255, green: 0xD1/255, blue: 0xC2/255))
                        .cornerRadius(10)
                        .frame(width: geometry.size.width / 1, height: geometry.size.height)
                    VStack(spacing: 0){
                        VStack{
                            ZStack{
                                Text(maxTextGasolina)
                                    .font(.subheadline)
                                    .frame(width: geometry.size.width / 1, height: geometry.size.height / 3)
                                    .minimumScaleFactor(0.5)
                                    .lineLimit(1)
                                Text("max")
                                    .offset(y: 10)
                            }
                        }
                        ZStack{
                            Text(atualTextGasolina)
                                .font(.largeTitle)
                                .frame(width: geometry.size.width / 1, height: geometry.size.height / 3)
                                .minimumScaleFactor(0.5)
                                .lineLimit(1)
                            Text("atual")
                                .offset(y: 20)
                        }
                        ZStack{
                            Text(minTextGasolina)
                                .font(.subheadline)
                                .frame(width: geometry.size.width / 1, height: geometry.size.height / 3)
                                .minimumScaleFactor(0.5)
                                .lineLimit(1)
                            Text("min")
                                .offset(y: 10)
                        }
                        
                    }
                }
            }
        }.padding()
        
    }
}

struct BotaoAbastecerAgora: View {
    var body: some View {
        ZStack{
            Text("teste")
        }
    }
}

struct OutroRetanguloView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack{
            Color.black
            OutroRetanguloView()
                .environmentObject(DadosCalculados())
                .environmentObject(DadosCadastrados())
            
        }.ignoresSafeArea(.all)
    }
}




//.foregroundColor(Color(red: 0xB9/255, green: 0xD1/255, blue: 0xC2/255))

