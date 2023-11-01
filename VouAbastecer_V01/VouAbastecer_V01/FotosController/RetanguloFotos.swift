//
//  RetanguloFotos.swift
//  VouAbastecer_V01
//
//  Created by Tales Carvalho on 18/10/23.
//

import SwiftUI

struct RetanguloFotos: View {
    var body: some View {
        GeometryReader { geometry in
            HStack(spacing: 0){
                ZStack{
                    GeometryReader { geometry in
                        ZStack{
                            Image("Delorean")
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: geometry.size.width / 0.8, height: geometry.size.height / 0.8)
                                .clipShape(RoundedRectangle(cornerRadius: 10))
                        }
                    }
                }
                
            }.padding()
        }
    }
}


struct RetanguloFotos_Previews: PreviewProvider {
    static var previews: some View {
        RetanguloFotos()
           
        
    }
}
