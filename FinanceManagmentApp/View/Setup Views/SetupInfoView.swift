//
//  SetupInfoView.swift
//  FinanceManagmentApp
//
//  Created by Zahra Majed Alzawad on 18/05/1444 AH.
//

import SwiftUI

struct SetupInfoView: View {
    @EnvironmentObject var userData : User
    @State private var showNextScreen = false
    
    var body: some View {
        VStack {
            Text("Setup info!")
            
            Button("Discover my routine") {
                showNextScreen = true
            }
            .frame(width: 346, height: 41)
            .background(Color.green)
            .foregroundColor(.white)
            .cornerRadius(10)
            /*.fullScreenCover(isPresented: $showNextScreen) {
                PhoneNumberPInfo()
            }*/
            
            NavigationLink(destination: PhoneNumberPInfo(), isActive: $showNextScreen) {
                Text("")
                    .hidden()
            }
        }
    }
}

struct SetupInfoView_Previews: PreviewProvider {
    static var previews: some View {
        SetupInfoView()
    }
}
