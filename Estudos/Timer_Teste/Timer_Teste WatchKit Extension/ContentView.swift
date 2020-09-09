//
//  ContentView.swift
//  Timer_Teste WatchKit Extension
//
//  Created by Tales Seixas de Carvalho on 12/08/20.
//  Copyright © 2020 Tales Seixas de Carvalho. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @State var segundaTelaAparece = false
    @State var timerVal = 1
    
    var body: some View {
        VStack{
            Text("Selecione \(timerVal) timer")
            Picker(selection: $timerVal, label: Text("")) {
                Text("1").tag(1)
                Text("5").tag(5)
                Text("10").tag(10)
                Text("15").tag(15)
                Text("20").tag(20)
            }
            NavigationLink(destination: SeguntaTela(segundaTelaAparece: $segundaTelaAparece, timerVal: timerVal) , isActive: $segundaTelaAparece, label: {Text("Go")})
                .foregroundColor(.green)
        }
        
    }
}


struct SeguntaTela: View{
    
    @Binding var segundaTelaAparece: Bool
    @State var timerVal:Int
    
    var body: some View {
        VStack{
            if timerVal > 0 {
            Text("Tempo que falta!")
                .font(.system(size: 14))
            Text("\(timerVal)")
                .font(.system(size: 40))
                .onAppear(){
                    Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { (timer) in
                        if self.timerVal > 0{
                            self.timerVal -= 1
                        }
                    }
                }
            Text("Segundos")
                .font(.system(size: 14))

            Button(action: {self.segundaTelaAparece = false}) {
                Text("Cancel")
                    .foregroundColor(.red)
            }
            }else{
                Button(action: {self.segundaTelaAparece = false}) {
                    Text("Done")
                        .foregroundColor(.yellow)
                }
            }
        }
        
    }
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}



