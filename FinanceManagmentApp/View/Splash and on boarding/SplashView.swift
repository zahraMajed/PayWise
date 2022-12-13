//
//  SplashView.swift
//  FinanceManagmentApp
//
//  Created by Zahra Majed Alzawad on 18/05/1444 AH.
//

import SwiftUI

struct SplashView: View {
    //MARK: vars
    @AppStorage("Setup_Status") var isSetupDone = true
    @State private var isSplashActive = false
    
    var body: some View {
        if isSplashActive {
            //animation splash screen
            //make sure isSplashActive is false
        }else {
            if isSetupDone {
                NavigationView {
                    Login()
                        .navigationBarHidden(true)
                        .navigationBarBackButtonHidden(true)
                }
            } else {
                SetupInfoView()
            }
        }
    }
}

struct SplashView_Previews: PreviewProvider {
    static var previews: some View {
        SplashView()
    }
}
