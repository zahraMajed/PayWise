//
//  MoneyGrowthGoal.swift
//  FinanceManagmentApp
//
//  Created by raghad khalid alsaif on 21/05/1444 AH.
//


import SwiftUI

struct MoneyGrowthGoal: View {
    @State private var businessCost: String = ""
    //MARK: vars
    @EnvironmentObject var userData : User
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
                   
                    CheckView(title: "Opening Startup"){ isChecked in
                        if isChecked {
                            userData.businessAccount.gaols[1] = "Opening Startup"
                        }else {
                            if userData.businessAccount.gaols[1] != nil {
                                userData.businessAccount.gaols.removeValue(forKey: 1)
                            }
                        }
                    }
        
                    CheckView(title: "Stock Trading") { isChecked in
                        if isChecked {
                            userData.businessAccount.gaols[2] = "Stock Trading"
                        }else {
                            if userData.businessAccount.gaols[2] != nil {
                                userData.businessAccount.gaols.removeValue(forKey: 2)
                            }
                        }
                    }
                    
                }
                .frame(width: 355, height: 121)
                .background(Color("Gray4"))
                .cornerRadius(14)
                
                CustomTextField(textFieldLabel: "Business Cost", textFieldHint: "$50,000.00", isSwitch: false, isCurrancy: false, userInput: $businessCost)
                
                CustomTextFieldWithDate(textFieldLabel: "Business opening date", datePickerTitle: "Business opening date", selectedDate: $userData.businessAccount.businessDueDate)

            }
            Spacer()
            LargeButton(text: "Create Account", isfilled: true) {
                createFinancePlan()
                showNextView = true
                //creat the calculation and everything
                //alert if we gonna lock card.
            }
            Spacer()
        }
    }
    //MARK: functions
    func createFinancePlan(){
          guard let montlyIncom = Int(userData.monthlyIncom) else {
              return
          }
        guard let businessCost = Int(businessCost) else {
            return
        }
        userData.businessAccount.businessCost = businessCost
        
        // if liabilitiesCost more than 1/3 income
        if userData.liabilitiesAccount.liabilitiesCost > (montlyIncom/3) {
            if userData.liabilitiesAccount.liabilitiesCost < (montlyIncom * (2/3)) {
                //total balance
                userData.businessAccount.totalBalance += (montlyIncom/3)
                userData.liabilitiesAccount.totalBalance += userData.liabilitiesAccount.liabilitiesCost
                userData.personalAccount.totalBalance += montlyIncom - (montlyIncom/3)
                userData.liabilitiesAccount.liabilitiesCost
                //thisMonthBudget
                userData.businessAccount.thisMonthBudget += (montlyIncom/3)
                userData.liabilitiesAccount.thisMonthBudget += userData.liabilitiesAccount.liabilitiesCost
                userData.personalAccount.thisMonthBudget += montlyIncom - (montlyIncom/3)
                userData.liabilitiesAccount.liabilitiesCost
                // show alert here as a tips
            } else {
                // show alert here "it is important to cut down unimportant liabilitiesCost"
            }
            
        } else if userData.liabilitiesAccount.liabilitiesCost <= (montlyIncom/3) {
            let budgetPerAcc = (montlyIncom/3)
            userData.personalAccount.totalBalance += budgetPerAcc
            userData.liabilitiesAccount.totalBalance += budgetPerAcc
            userData.businessAccount.totalBalance += budgetPerAcc
            
            userData.personalAccount.thisMonthBudget = budgetPerAcc
            userData.liabilitiesAccount.thisMonthBudget = budgetPerAcc
            userData.businessAccount.thisMonthBudget = budgetPerAcc
        }
    }
    
}


struct MoneyGrowthGoal_Previews: PreviewProvider {
    static var previews: some View {
        MoneyGrowthGoal()
            .environmentObject(User())
    }
}
