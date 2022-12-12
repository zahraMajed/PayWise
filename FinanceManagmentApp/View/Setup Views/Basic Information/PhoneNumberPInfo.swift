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
        VStack{
            ViewTitleDescription(viewTitle: "Phone Number", viewDescription: "We will store and send a varivarion code to it")
            CustomPhoneTextField(countryPhoneCode: loginData.getCountryCode(), userInput: $loginData.phoneNumber)
            
            LargeButton(text: "Continue", isfilled: true) {
                
            }
        }
        
    }
}

struct PhoneNumberPInfo_Previews: PreviewProvider {
    static var previews: some View {
        PhoneNumberPInfo()
    }
}
