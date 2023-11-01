//
//  WelcomeView.swift
//  VouAbastecer_V2
//
//  Created by Tales Carvalho on 20/10/23.
//

import SwiftUI

struct WelcomeView: View {
    let goToMainView: () -> Void

    var body: some View {
        VStack {
            Text("Bem-vindo ao VouAbastecer_V2!")
            Button("Ir para a tela principal") {
                self.goToMainView()
            }
            .padding()
        }
    }
}





struct WelcomeView_Previews: PreviewProvider {
    static var previews: some View {
        WelcomeView(goToMainView: {})
    }
}
