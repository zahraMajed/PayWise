//
//  MoneyGrowthGoal.swift
//  FinanceManagmentApp
//
//  Created by raghad khalid alsaif on 21/05/1444 AH.
//


import SwiftUI

struct MoneyGrowthGoal: View {
    @State private var BusinessCost: String = ""
    @State private var selectedDate : Date = Date.now
    //MARK: vars
    @State private var showNextView : Bool = false

    var body: some View {
        VStack(){
            Spacer()
            ViewTitleDescription(viewTitle: "Money Growth Goal", viewDescription: "The Business Card will be managed according to your choice")
            Spacer()
            VStack (spacing: 17){
                
                VStack(alignment: .leading){
                    
                    Text("Goals to grow your money")
                        .font(.subheadline)
                        .foregroundColor(Color("Gray2"))
                        .padding([.top, .leading, .trailing], 12)
                        .padding(.bottom, 5)
                    
                    CheckView(title: "Opening Startup")
                    CheckView(title: "Stock Trading")
                    
                }
                .frame(width: 355, height: 121)
                .background(Color("Gray4"))
                .cornerRadius(14)
                
                CustomTextField(textFieldLabel: "Business Cost", textFieldHint: "$ 50,000.00", isSwitch: false, isCurrancy: false, userInput: $BusinessCost)
                
                CustomTextFieldWithDate(textFieldLabel: "Business opening date", datePickerTitle: "Business opening date", selectedDate: $selectedDate)
            }
            Spacer()
            LargeButton(text: "Create Account", isfilled: true) {
                showNextView = true
                //creat the calculation and everything
            }
            Spacer()
        }

    }
    
}


struct MoneyGrowthGoal_Previews: PreviewProvider {
    static var previews: some View {
        MoneyGrowthGoal()
    }
}
