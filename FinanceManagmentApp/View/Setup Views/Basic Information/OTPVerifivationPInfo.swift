//
//  OTPVerifivationPInfo.swift
//  FinanceManagmentApp
//
//  Created by Zahra Majed Alzawad on 18/05/1444 AH.
//

import SwiftUI

struct OTPVerifivationPInfo: View {
    //MARK: vars
    @ObservedObject var loginData : LoginViewModel
    
    //MARK: body
    var body: some View {
        VStack {
            ViewTitleDescription(viewTitle: "OTP Sent", viewDescription: "Enter the 4-digit code sent to your phone number. Didn't receive it ?")
            OTPTextField(loginData: loginData)
            
            LargeButton(text: "Continue", isfilled: true) {
                
            }
        }
    }
}

struct OTPVerifivationPInfo_Previews: PreviewProvider {
    static var previews: some View {
        OTPVerifivationPInfo(loginData: LoginViewModel())
    }
}
