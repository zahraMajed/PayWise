//
//  FinancialInfoView.swift
//  FinanceManagmentApp
//
//  Created by raghad khalid alsaif on 24/05/1444 AH.
//

import SwiftUI

struct FinancialInfoView: View {
    //MARK: vars
    @State private var shouldGo : Bool = false
    @EnvironmentObject var userData : User
    
    //MARK: body
    var body: some View {
        VStack(){
            Spacer()
            ViewTitleDescription(viewTitle: "Financial Information", viewDescription: "We will store and send a varivarion code to it")
            Spacer(minLength: 100)
            CustomTextField(textFieldLabel: "Monthly income", textFieldHint: "0.00", isSwitch: true, isCurrancy: true, userInput: $userData.monthlyIncom)
                .keyboardType(.numberPad)
            
            Spacer(minLength: 380)
            
            LargeButton(text: "Continue", isfilled: true) {
                shouldGo = true
            }
            
            Spacer()
            NavigationLink(destination: RecurringLiabilitiesView(), isActive: $shouldGo) {
            }.labelsHidden()
                
        }
        .navigationBarHidden(true)
        .navigationBarBackButtonHidden(true)
    }
}

struct FinancialInfoView_Previews: PreviewProvider {
    static var previews: some View {
        FinancialInfoView()
            .environmentObject(User())
    }
}
