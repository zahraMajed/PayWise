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
    @Published var personalAccount  =  PersonalAccount(cardInfo: CardInfo(cardNumber: "", cvv: "", expDate: ""), cardSetting: CardSetting(cardLimit: 0, isCardLocked: false, isEcommerceTransDisabled: false), totalBalance: 0, thisMonthBudget: 0, thisMonthExpense: 0)
    @Published var liabilitiesAccount = LiabilitiesAccount(cardInfo: CardInfo(cardNumber: "", cvv: "", expDate: "") , cardSetting: CardSetting(cardLimit: 0, isCardLocked: false, isEcommerceTransDisabled: false), liabilities: Liabilities(liabilityName: "", liabilityCost: 0), liabilitiesCost: 0, totalBalance: 0, thisMonthBudget: 0, thisMonthExpense: 0)
    
    /*init(personalAccount: PersonalAccount, liabilitiesAccount: LiabilitiesAccount) {
        self.personalAccount = personalAccount
        self.liabilitiesAccount = liabilitiesAccount
    }*/
}
