//
//  CelulaViagemView.swift
//  Kactus Viagens UIKit
//
//  Created by Tales Carvalho on 07/07/20.
//  Copyright © 2020 Tales Carvalho. All rights reserved.
//

import SwiftUI

struct CelulaViagemView: View {
    @Environment(\.horizontalSizeClass) var horizontalSizeClass
    var viagem: Viagem
    
    var body: some View {
        
       VStack(alignment: .leading){
           Text(viagem.titulo)
            .font(.custom("Avenir", size: self.horizontalSizeClass == .compact ? 14 : 24))
           Image(viagem.imagem)
            .resizable()
            .aspectRatio(contentMode: .fill)
            .frame(height: self.horizontalSizeClass == .compact ? 125 : 200)
            .clipped()
        
           HStack{
               Text(viagem.quantidadeDeDias)
            .font(.custom("Avenir", size: self.horizontalSizeClass == .compact ? 14 : 24))
               Spacer()
               Text(viagem.valor)
            .font(.custom("Avenir", size: self.horizontalSizeClass == .compact ? 14 : 24))
           }
       }
    }
}

struct CelulaViagemView_Previews: PreviewProvider {
    static var previews: some View {
        
        
        CelulaViagemView(viagem: viagens[0])
            .previewLayout(.fixed(width: 350, height: 200))
    }
}
