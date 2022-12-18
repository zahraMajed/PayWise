//
//  Splashscreen.swift
//  OnBoarding1
//
//  Created by Shaden on 20/05/1444 AH.
//

import SwiftUI

// splash screen 
        
struct SplashScreen: View {
         @State var isActive : Bool = false
         @State private var size = 0.8
         @State private var opacity = 0.5

var body: some View {
    if isActive {
                 ContentView()
    } else {

        ZStack{

            Rectangle()
            LinearGradient(gradient: Gradient(colors: [Color.white, Color("Purpe")]), startPoint: /*@START_MENU_TOKEN@*/.leading/*@END_MENU_TOKEN@*/, endPoint: /*@START_MENU_TOKEN@*/.trailing/*@END_MENU_TOKEN@*/)
                       .ignoresSafeArea()


        VStack {
            Image("logo")
                .font(.system(size: 90))
        }
        .scaleEffect(size)
        .opacity(opacity)
        .onAppear {
            withAnimation(.easeIn(duration: 1.2)) {
                self.size = 0.6
                self.opacity = 1.00
            }
        }
    }
    .onAppear {
DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
                           withAnimation {
                               self.isActive = true
                           }
                       }
                   }
               }



    }
}

struct SplashScreen_Previews: PreviewProvider {
    static var previews: some View {
        SplashScreen()
    }
}

