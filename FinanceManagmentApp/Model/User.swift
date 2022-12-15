//
//  User.swift
//  FinanceManagmentApp
//
//  Created by Zahra Majed Alzawad on 19/05/1444 AH.
//

import Foundation

class User: ObservableObject {
    @Published var name = ""
    @Published var countryPhoneCode = ""
    @Published var phoneNumber = ""
    @Published var dateOfBirth = Date.now
    @Published var nationalID = ""
    @Published var personalAccount  =  PersonalAccount(cardInfo: CardInfo(cardNumber: "1111 2222 3333 4444", cvv: "333", expDate: "12/10", cardColor: "Gray1"), cardSetting: CardSetting(cardLimit: 3000, isCardLocked: false, isEcommerceTransDisabled: false), totalBalance: 3000, thisMonthBudget: 3000, thisMonthExpense: 2000)
    
    @Published var liabilitiesAccount = LiabilitiesAccount(cardInfo: CardInfo(cardNumber: "", cvv: "", expDate: "", cardColor: "PrimaryBlueLight") , cardSetting: CardSetting(cardLimit: 0, isCardLocked: false, isEcommerceTransDisabled: false), liabilities: Liabilities(liabilityName: "", liabilityCost: 0), liabilitiesCost: 0, totalBalance: 0, thisMonthBudget: 0, thisMonthExpense: 0)
    
    /*init(personalAccount: PersonalAccount, liabilitiesAccount: LiabilitiesAccount) {
        self.personalAccount = personalAccount
        self.liabilitiesAccount = liabilitiesAccount
    }*/
}
