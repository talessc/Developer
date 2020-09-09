//
//  ContentView.swift
//  TestandoEAprendendo
//
//  Created by Tales Seixas de Carvalho on 28/08/20.
//  Copyright © 2020 Tales Seixas de Carvalho. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
    
            Text("Controle")
                .font(.system(.title))
            
 
            HStack{
                ZStack{
                    Image("car.fill")
                        .frame(width: 100, height: 100, alignment: .center)
                    RoundedRectangle(cornerRadius: 8.0)
                        .frame(width: 120, height: 130, alignment:  .topLeading)
                        .foregroundColor(.gray)
   
                }
                VStack{
                    
                    RoundedRectangle(cornerRadius: 8.0)
                    .frame(width: 220, height: 50, alignment: .topLeading)
                    RoundedRectangle(cornerRadius: 8.0)
                    .frame(width: 220, height: 60, alignment: .topLeading)
                }


            }
            ZStack{
                RoundedRectangle(cornerRadius: 10.0)
                    .frame(width: 350, height: 25, alignment: .center)
                    .foregroundColor(.gray)
                Text("Média de KM/L")
                    .fontWeight(.light)
                    .foregroundColor(Color.white)
                    .multilineTextAlignment(.center)
                    
                
            }


            Text("Hello, World!")
            Spacer()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
