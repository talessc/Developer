//
//  HomeView.swift
//  Restart
//
//  Created by Tales Carvalho on 18/12/21.
//

import SwiftUI

struct HomeView: View {
   // MARK: - PROPRETY
    
    @AppStorage("onboarding") var isOnboardingViewActive: Bool = false
    
    @State private var isAnimating: Bool = false
    
  
// MARK: BODY
    var body: some View {
        VStack(spacing: 20){
            // MARK: - HEADER
            Spacer()
            ZStack{
                
                CircleGroupView(ShapeColor: .gray, ShapeOpacity: 0.1)
                
                Image("character-2")
                    .resizable()
                    .scaledToFit()
                    .padding()
                    .offset(y: isAnimating ? 35 : -35)
                    .animation(
                        Animation
                            .easeOut(duration: 4)
                            .repeatForever()
                        , value: isAnimating)
                    
            }//Zstack
            
            // MARK: - CENTER
            Text("The time the leads to mastery is dependet on the intensity of our focus")
                .font(.title3)
                .fontWeight(.light)
                .foregroundColor(.secondary)
                .multilineTextAlignment(.center)
                .padding()
            
            // MARK: - FOOTER
            Button(action: {
                withAnimation {
                playSound(sound: "success", type: "m4a")
                    isOnboardingViewActive = true
                }
            }) {
                Image(systemName: "arrow.triangle.2.circlepath.circle.fill")
                    .imageScale(.large)
                
                Text("Restart")
                    .font(.system(.title3, design: .rounded))
                    .fontWeight(.bold)
                
                
            }//:Button
            .buttonStyle(.borderedProminent)
            .buttonBorderShape(.capsule)
            .controlSize(.large)
            
        }//: Vstack
        .onAppear (perform: {
            DispatchQueue.main.asyncAfter(deadline: .now(), execute: {
                isAnimating = true
            })
        })
    }
}
    
// MARK: - PREVIEW
struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
