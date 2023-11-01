//
//  ContentView.swift
//  Shared
//
//  Created by Tales Carvalho on 18/12/21.
//

import SwiftUI



struct ContentView: View {
    @AppStorage("onboarding") var isOnboardingViewActive: Bool = true
    
    var body: some View {
        ZStack{
            if isOnboardingViewActive {
                OnboardingView()
            } else {
                HomeView()
            }
        }//: Zstack
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
