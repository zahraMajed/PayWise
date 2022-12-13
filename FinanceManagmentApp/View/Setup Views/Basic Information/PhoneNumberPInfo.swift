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
    
    var body: some View {
            VStack(){
                
                ViewTitleDescription(viewTitle: "Phone Number", viewDescription: "We will store it and send OTP to it")
                
                CustomPhoneTextField(countryPhoneCode: loginData.getCountryCode(), userInput: $loginData.phoneNumber)
                
                LargeButton(text: "Continue", isfilled: true) {
                    Task{await loginData.sendOTP()}
                    print("code sent")
                }
                .disabled(loginData.phoneNumber == "" ? true : false)
                .opacity(loginData.phoneNumber == "" ? 0.4 : 1)
                
                NavigationLink(destination: OTPVerifivationPInfo(loginData: loginData), isActive: $loginData.shouldGoToVerify) {
                    Text("")
                        .hidden()
                }
            }
    }
}

struct PhoneNumberPInfo_Previews: PreviewProvider {
    static var previews: some View {
        PhoneNumberPInfo()
    }
}
