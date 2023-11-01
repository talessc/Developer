//
//  AbastecendoView.swift
//  VouAbastecer_V01
//
//  Created by Tales Carvalho on 18/10/23.
//
import SwiftUI


struct AbastecendoView: View {
  
    
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @EnvironmentObject var dadosCadastrados: DadosCadastrados
    @EnvironmentObject var dadosCalculados: DadosCalculados
    @EnvironmentObject var calculos: Calculos
    
    let preçoDoCombustível: Double
    let litrosAbastecidos: Double
    let quilometragemAtual: Double
    
    @EnvironmentObject var funcoes: Funcoes
    
    /*@State var preçoDoCombustível = ""
    @State private var litrosAbastecidos = ""
    @State private var quilometragemAtual = ""*/
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
    


    
    var body: some View {
        NavigationView{
            ZStack {
                Color(red: 0x14 / 255, green: 0x34 / 255, blue: 0x61 / 255)
                    .edgesIgnoringSafeArea(.all)
                
                VStack {
                    Text("Abastecendo")
                        .font(.largeTitle)
                        .foregroundColor(.white)
                    
                    TextField("Preço do combustível. Última preço: \(dadosCadastrados.preçoDoCombustívelArray.last ?? "0.0")", text: calculos.$preçoDoCombustível)
                        .padding()
                        .background(Color.white)
                        .cornerRadius(8.0)
                        .padding(.bottom, 20)
                                    .onChange(of: preçoDoCombustível, perform: { value in
                                        self.calculateTotal()
                        })
                    
                    TextField("Litros abastecidos. Último: \(dadosCadastrados.litrosAbastecidosArray.last ?? "0.0")", text: calculos.$litrosAbastecidos)
                        .padding()
                        .background(Color.white)
                        .cornerRadius(8.0)
                        .padding(.bottom, 20)
                        .onChange(of: litrosAbastecidos, perform: { value in
                            self.calculateTotal()
                        })
                    
                    TextField("Quilometragem atual. A última: \(dadosCadastrados.quilometragemAtualArray.last ?? "0.0")", text: calculos.$quilometragemAtual, onCommit: validateQuilometragem)
                        .padding()
                        .background(Color.white)
                        .cornerRadius(8.0)
                        .padding(.bottom, 20)

                    TextField("Total da abastecida. Último valor:  \(dadosCalculados.preçoTotalDaAbastecidaArray.last ?? "0.0")", text: calculos.$preçoTotalDaAbastecida)
                        .padding()
                        .background(Color.white)
                        .cornerRadius(8.0)
                        .padding(.bottom, 20)
                    
                    Picker("Tipo de Combustível", selection: $tipoDeCombustivel) {
                        Text("Gasolina").tag("Gasolina")
                        Text("Álcool").tag("Álcool")
                    }
                    .pickerStyle(SegmentedPickerStyle())
                    .padding(.bottom, 20)

                    
                    Button(action: {
                        
                        self.salvar()
                        self.isLinkActive = true
                        self.presentationMode.wrappedValue.dismiss()
                        
                        
                    }) {
                        Text("Salvar")
                            .font(.title)
                            .foregroundColor(.white)
                            .padding()
                            .background(Color.blue)
                            .cornerRadius(10.0)
                    }
                   // .disabled(preçoDoCombustível.isEmpty || litrosAbastecidos.isEmpty || quilometragemAtual.isEmpty || preçoTotalDaAbastecida.isEmpty)
                    
                    //MARK: NavigationLink
                    NavigationLink(
                        destination: ContentView(),
                        isActive: $isLinkActive
                    ) {
                        EmptyView()
                    }
                }
                .padding()
              
                .alert(isPresented: $showAlert) {
                    if showValidationError {
                        return Alert(title: Text("Erro"), message: Text("A quilometragem inserida não pode ser menor ou igual à última quilometragem guardada."), dismissButton: .default(Text("OK")))
                    } else {
                        return Alert(title: Text(alertTitle), message: Text(alertMessage), dismissButton: .default(Text("OK")))
                    }
                }
            }.navigationBarHidden(true)
                .navigationBarBackButtonHidden(true)
        }
    }
    
    //import Calculos
    
    func validateQuilometragem(){
        calculos.validateQuilometragem()
    }
    
    /*private func validateQuilometragem() {
        if let lastKm = Double(dadosCadastrados.quilometragemAtualArray.last ?? ""),
           let currentKm = Double(quilometragemAtual),
           currentKm <= lastKm {
               showValidationError = true
        }
    }*/


    func calculateTotal() {
        calculos.calculateTotal()
    }
    /*private func calculateTotal() {
        if let preço = Double(preçoDoCombustível), let litros = Double(litrosAbastecidos) {
            let total = preço * litros
            preçoTotalDaAbastecida = String(format: "%.2f", total)
        }
    }*/

    func salvar(){
        calculos.salvar()
    }
    /*private func salvar() {
        dadosCadastrados.preçoDoCombustívelArray.append(preçoDoCombustível)
        dadosCadastrados.litrosAbastecidosArray.append(litrosAbastecidos)
       // dadosCadastrados.preçoTotalDaAbastecidaArray.append(preçoTotalDaAbastecida)
        
        if let últimaData = dadosCadastrados.datasDeCadastroArray.last {
                let diferença = Date().timeIntervalSince(últimaData)
                //dadosCadastrados.diferençaEntreDatas.append(diferença)
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
                   // dadosCalculados.mediaArray.append(media)
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

            // Calcula a média usando a última distância percorrida e os litros abastecidos.
            if let distanciaPercorrida = dadosCadastrados.ultimaDistanciaArray.last, let litrosAbastecidosDouble = Double(litrosAbastecidos) {
                media = distanciaPercorrida / litrosAbastecidosDouble
                let formattedMedia = Double(String(format: "%.2f", media)) ?? 0.0
                dadosCalculados.mediaArray.append(formattedMedia)
            }

            if let quilometragemAtualDouble = Double(quilometragemAtual) {
                dadosCalculados.quilometragemTotalArray.append(quilometragemAtualDouble)
            }
        
        
        /*var media = 0.0
        if let quilometragemAtualDouble = Double(quilometragemAtual), let litrosAbastecidosDouble = Double(litrosAbastecidos) {
            media = (quilometragemAtualDouble - (penultimoQuilometragem ?? 0.0)) / litrosAbastecidosDouble
            // Formatando a média para ter apenas duas casas decimais.
            let formattedMedia = Double(String(format: "%.2f", media)) ?? 0.0
            dadosCalculados.mediaArray.append(formattedMedia)
            quilometragemTotal = quilometragemAtualDouble
        }*/

        
        
        /*var media = 0.0
   
        if let distanciaPercorrida = dadosCadastrados.ultimaDistancia.last, let litrosAbastecidosDouble = Double(litrosAbastecidos) {
            media = distanciaPercorrida / litrosAbastecidosDouble
            dadosCalculados.mediaArray.append(media)
        }*/

        
       /* if let quilometragemAtualDouble = Double(quilometragemAtual), let litrosAbastecidosDouble = Double(litrosAbastecidos) {
            media = (quilometragemAtualDouble - (penultimoQuilometragem ?? 0.0)) / litrosAbastecidosDouble

            //media = (quilometragemAtualDouble - quilometragemTotal) / litrosAbastecidosDouble //quilometragemTotal deve ser o último dado da Array - Consertar!!!!!
           dadosCalculados.mediaArray.append(media)
            quilometragemTotal = quilometragemAtualDouble
        }*/
        
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
    }*/
    
    func calcularDiasRodados(){
        calculos.calcularDiasRodados()
    }
    /*private func calcularDiasRodados() {
        var dataUltimaAbastecida = 0
    }*/
    
}


extension Array {
    subscript(safe index: Int) -> Element? {
        return indices.contains(index) ? self[index] : nil
    }
}


struct AbastecendoView_Previews: PreviewProvider {
    static var previews: some View {
        AbastecendoView(preçoDoCombustível: 0.0, litrosAbastecidos: 0.0, quilometragemAtual: 0.0)
            .environmentObject(DadosCalculados())
            .environmentObject(DadosCadastrados())
            .environmentObject(Calculos())
    }
}
