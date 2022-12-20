//
//  PhoneNumberPInfo.swift
//  FinanceManagmentApp
//
//  Created by Zahra Majed Alzawad on 18/05/1444 AH.
//

import SwiftUI

struct PhoneNumberPInfo: View {
    //MARK: vars
    @StateObject var loginData = LoginViewModel()
    @EnvironmentObject var userData : User
    
    var body: some View {
        ZStack {
            VStack(alignment: .leading){
                Spacer()
                ViewTitleDescription(viewTitle: "Phone Number", viewDescription: "We will store it and send OTP to it")
                Spacer()
                CustomPhoneTextField(countryPhoneCode: loginData.getCountryCode(), userInput: $loginData.phoneNumber)
                Spacer(minLength: 377)
                LargeButton(text: "Continue", isfilled: true) {
                    //updating USER struct
                    print(" Before \(userData.countryPhoneCode) and \(userData.phoneNumber)")
                    userData.phoneNumber = loginData.phoneNumber
                    userData.countryPhoneCode = loginData.getCountryCode()
                    print(" After \(userData.countryPhoneCode) and \(userData.phoneNumber)")
                    Task{await loginData.sendOTP()}
                    print("code sent")
                }
                .disabled(loginData.phoneNumber == "" ? true : false)
                .opacity(loginData.phoneNumber == "" ? 0.4 : 1)
                Spacer()
                NavigationLink(destination: OTPVerifivationPInfo(loginData: loginData), isActive: $loginData.shouldGoToVerify) {
                    Text("")
                        .hidden()
                }
            }
            
            if loginData.isError {
                CustomAlert(presentAlert: $loginData.isError, alertType: .error(title: "Error", message: loginData.errorMsg))
            }
        }
    }
}

struct PhoneNumberPInfo_Previews: PreviewProvider {
    static var previews: some View {
        PhoneNumberPInfo()
    }
}
