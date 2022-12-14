//
//  SplashView.swift
//  FinanceManagmentApp
//
//  Created by Zahra Majed Alzawad on 18/05/1444 AH.
//

import SwiftUI

struct SplashView: View {
    //MARK: vars
    @AppStorage("Setup_Status") var isSetupDone = false
    @State private var isSplashActive = false
    @EnvironmentObject var userData : User
    /// do i need to declare this on every view in flow? or only on views that need to access infro from the model, for example here i do not need to access any data (but its view in a flow to another view which i need a data on!
    var body: some View {
        if isSplashActive {
            //animation splash screen
            //make sure isSplashActive is false
        }else {
            if isSetupDone {
                NavigationView {
                    Login()
                        //.environmentObject(userData)
                }
            } else {
                /// How to end navigation view? (i need the navigation view only for 2 views then i need view with full screen then after that i need navigation view again
                NavigationView {
                    SetupInfoView()
                }
            }
        }
    }
    
}

struct SplashView_Previews: PreviewProvider {
    static var previews: some View {
        SplashView()
    }
}

//Questions:
///About button with keyboard
///making user struct as AppStorage
