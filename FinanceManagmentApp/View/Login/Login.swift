//
//  Login.swift
//  FinanceManagmentApp
//
//  Created by Zahra Majed Alzawad on 18/05/1444 AH.
//

import SwiftUI
import LocalAuthentication

struct Login: View {
    //MARK: vars
    @StateObject var loginData = LoginViewModel()
    
    //MARK: body
    var body: some View {
        VStack(alignment: .leading){
            Spacer()
            ViewTitleDescription(viewTitle: "Phone Number", viewDescription: "We will send you a one time password")
            Spacer()
            CustomPhoneTextField(countryPhoneCode: loginData.getCountryCode(), userInput: $loginData.phoneNumber)
            Spacer(minLength: 377)
            
            LargeButton(text: "Continue", isfilled: true) {
                Task{await loginData.sendOTP()}
                print("code sent")
            }
            .disabled(loginData.phoneNumber == "" ? true : false)
            .opacity(loginData.phoneNumber == "" ? 0.4 : 1)
            Spacer()
            
            NavigationLink(destination: OTPVerifivation(loginData: loginData), isActive: $loginData.shouldGoToVerify) {
                Text("")
                    .hidden()
            }
            
        }
        .onAppear(perform: authenticate)
        
    }
    
    //MARK: functions
    func authenticate() {
        let context = LAContext()
        var error: NSError?

        // check whether biometric authentication is possible
        if context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error) {
            // it's possible, so go ahead and use it
            let reason = "We need to unlock your data.!"
            
            context.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: reason) { success, authenticationError in
                // authentication has now completed
                if success {
                    // authenticated successfully
                    DispatchQueue.main.async {
                        loginData.isLoggedIn = true
                    }
                } else {
                    // there was a problem
                   return
                }
            }
        } else {
            // no biometrics
            return
        }
    }
}

struct Login_Previews: PreviewProvider {
    static var previews: some View {
        Login()
    }
}
