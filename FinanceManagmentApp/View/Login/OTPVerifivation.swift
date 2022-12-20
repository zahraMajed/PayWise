//
//  OTPVerifivation.swift
//  FinanceManagmentApp
//
//  Created by Zahra Majed Alzawad on 18/05/1444 AH.
//

import SwiftUI

struct OTPVerifivation: View {
    //MARK: vars
    @ObservedObject var loginData : LoginViewModel
    
    //MARK: body
    var body: some View {
        ZStack {
            VStack {
                Spacer()
                ViewTitleDescription(viewTitle: "OTP Sent", viewDescription: "Enter the 6-digit code sent to your phone number.")
                Spacer()
                OTPTextField(loginData: loginData)
                Spacer(minLength: 377)
                LargeButton(text: "Continue", isfilled: true) {
                    Task{await loginData.verifyOTP()}
                }
                .disabled(checkOTPFieldStates())
                .opacity(checkOTPFieldStates() ? 0.4 : 1)
                
                PlainButton(text: "Resend OTP") {
                    loginData.requestCode()
                }
                Spacer()
                //should go to the Home withouth navigation link.
                NavigationLink(destination: TabMainView(), isActive: $loginData.isLoggedIn) {
                }.labelsHidden()
            }
            if loginData.isError {
                CustomAlert(presentAlert: $loginData.isError, alertType: .error(title: "Error", message: loginData.errorMsg))
            }
        }.navigationBarHidden(true)
            .navigationBarBackButtonHidden(true)
        
    }
    //MARK: function
    func checkOTPFieldStates() -> Bool {
        for index in 0..<6 {
            if loginData.otpFields[index].isEmpty {
                return true
            }
        }
        return false
    }
}

struct OTPVerifivation_Previews: PreviewProvider {
    static var previews: some View {
        OTPVerifivation(loginData: LoginViewModel())
    }
}
