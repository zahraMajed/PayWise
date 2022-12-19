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
    @Published var monthlyIncom = ""
    
    @Published var personalAccount  =  PersonalAccount(cardInfo: CardInfo(accountType: .Personal, cardName: "Persoanl Card", cardNumber: "1111 2222 3333 4444", cardCVV: "333", cardColor: "Gray1", cardExpDate: "12/10"), cardSetting: CardSetting(cardLimit: 3000, isCardLocked: false, isEcommerceTransDisabled: false), totalBalance: 3000, thisMonthBudget: 3000, thisMonthExpense: 2000)
    
    @Published var liabilitiesAccount = LiabilitiesAccount(cardInfo: CardInfo(accountType: .Liabilities, cardName: "Liability Card", cardNumber: "1111 2222 3333 4444", cardCVV: "444", cardColor: "PrimaryBlueLight", cardExpDate: "12/10"), cardSetting: CardSetting(cardLimit: 0, isCardLocked: false, isEcommerceTransDisabled: false), liabilities: [], liabilitiesCost: 0, totalBalance: 0, thisMonthBudget: 0, thisMonthExpense: 0)
    
    @Published var businessAccount = BusinessAccount(cardInfo: CardInfo(accountType: .Business, cardName: "Business Card", cardNumber: "1111 2222 3333 4444", cardCVV: "760", cardColor: "AccentPurpleLight", cardExpDate: "13/3"), cardSetting: CardSetting(cardLimit: 0, isCardLocked: true, isEcommerceTransDisabled: true), gaols: [], totalBalance: 0, thisMonthBudget: 0, thisMonthExpense: 0)

    
    /*init(personalAccount: PersonalAccount, liabilitiesAccount: LiabilitiesAccount) {
        self.personalAccount = personalAccount
        self.liabilitiesAccount = liabilitiesAccount
    }*/
}
