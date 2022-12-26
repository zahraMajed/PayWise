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
        ZStack {
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
                                if userData.businessAccount.gaols[2] == nil {
                                    userData.businessAccount.cardSetting.isCardLocked = true
                                }
                            }else {
                                if userData.businessAccount.gaols[1] != nil {
                                    userData.businessAccount.gaols.removeValue(forKey: 1)
                                    
                                }
                            }
                        }
                        CheckView(title: "Stock Trading") { isChecked in
                            if isChecked {
                                userData.businessAccount.gaols[2] = "Stock Trading"
                                userData.businessAccount.cardSetting.isCardLocked = false
                            }else {
                                if userData.businessAccount.gaols[2] != nil {
                                    userData.businessAccount.gaols.removeValue(forKey: 2)
                                    if userData.businessAccount.gaols[1] != nil {
                                        userData.businessAccount.cardSetting.isCardLocked = true
                                    }
                                }
                            }
                        }
                        
                    }
                    .frame(width: 355, height: 121)
                    .background(Color("Gray4"))
                    .cornerRadius(14)
                    
                    CustomTextField(textFieldLabel: "Business Cost", textFieldHint: "50,000.00 SR", isSwitch: false, isCurrancy: false, userInput: $businessCost)
                    
                    CustomTextFieldWithDate(textFieldLabel: "Business opening date", datePickerTitle: "Business opening date", selectedDate: $userData.businessAccount.businessDueDate)

                }
                Spacer(minLength: 150)
                LargeButton(text: "Create Account", isfilled: true) {
                    createFinancePlan()
                    //alert if we gonna lock card.
                    showNextView = true
                }
                Spacer()
                NavigationLink(destination: FaceIdPermission(), isActive: $showNextView) {
                }.labelsHidden()
            }
            
            if userData.businessAccount.cardSetting.isCardLocked {
                CustomAlert(presentAlert: $userData.businessAccount.cardSetting.isCardLocked, alertType: .error(title: "Locked Card", message: "The business card will be locked until the business cost is available"))
            }
            
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
        
        if userData.liabilitiesAccount.liabilitiesCost > (montlyIncom/3) {
            if userData.liabilitiesAccount.liabilitiesCost < (montlyIncom * (2/3)) {
                //total balance
                userData.businessAccount.totalBalance += (montlyIncom/3)
                userData.liabilitiesAccount.totalBalance += userData.liabilitiesAccount.liabilitiesCost
                userData.personalAccount.totalBalance += montlyIncom - (montlyIncom/3) - userData.liabilitiesAccount.liabilitiesCost
                //thisMonthBudget
                userData.businessAccount.thisMonthBudget += (montlyIncom/3)
                userData.liabilitiesAccount.thisMonthBudget += userData.liabilitiesAccount.liabilitiesCost
                userData.personalAccount.thisMonthBudget += montlyIncom - (montlyIncom/3) - userData.liabilitiesAccount.liabilitiesCost
                //card limit
                userData.businessAccount.cardSetting.cardLimit = (montlyIncom/3)
                userData.liabilitiesAccount.cardSetting.cardLimit = userData.liabilitiesAccount.liabilitiesCost
                userData.personalAccount.cardSetting.cardLimit = montlyIncom - (montlyIncom/3) - userData.liabilitiesAccount.liabilitiesCost
            } else {
                // show alert here "it is important to cut down unimportant liabilitiesCost"
            }
            
        } else if userData.liabilitiesAccount.liabilitiesCost <= (montlyIncom/3) {
            let budgetPerAcc = (montlyIncom/3)
            userData.personalAccount.totalBalance += budgetPerAcc
            userData.liabilitiesAccount.totalBalance += budgetPerAcc
            userData.businessAccount.totalBalance += budgetPerAcc
            //thisMonthBudget
            userData.personalAccount.thisMonthBudget = budgetPerAcc
            userData.liabilitiesAccount.thisMonthBudget = budgetPerAcc
            userData.businessAccount.thisMonthBudget = budgetPerAcc
            //card limit
            userData.businessAccount.cardSetting.cardLimit = budgetPerAcc
            userData.liabilitiesAccount.cardSetting.cardLimit = budgetPerAcc
            userData.personalAccount.cardSetting.cardLimit = budgetPerAcc
        }
        
        /*if userData.businessAccount.gaols.count > 1 {
            userData.businessAccount.cardSetting.isCardLocked = false
        } else if userData.businessAccount.gaols.count == 1 {
            if userData.businessAccount.gaols[1] != nil {
                userData.businessAccount.cardSetting.isCardLocked = true
            }else {
                userData.businessAccount.cardSetting.isCardLocked = false
            }
        }*/
        
        userData.isSetupDone = true
    }
    
}


struct MoneyGrowthGoal_Previews: PreviewProvider {
    static var previews: some View {
        MoneyGrowthGoal()
            .environmentObject(User())
    }
}
