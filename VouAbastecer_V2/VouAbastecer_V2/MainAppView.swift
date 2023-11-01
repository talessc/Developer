//
//  MainAppView.swift
//  VouAbastecer_V2
//
//  Created by Tales Carvalho on 20/10/23.
//

import SwiftUI

struct MainAppView: View {
    let resetAndGoBack: () -> Void
    
    var body: some View {
        VStack{
        Text("Tela Principal")
        Button("Voltar para WelcomeView") {
                        self.resetAndGoBack()
                    }
        .padding()
        }
        
    }
}


struct MainAppView_Previews: PreviewProvider {
    static var previews: some View {
        MainAppView(resetAndGoBack: {})
    }
}
