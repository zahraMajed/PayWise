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
    
    @Published var personalAccount  =  PersonalAccount(cardInfo: CardInfo(accountType: .Personal, cardNumber: generateCreditCardNumber(for: .Visa), cardCVV: generateCVV(), cardExpDate: "12/10"), cardSetting: CardSetting(cardLimit: 0, isCardLocked: false, isEcommerceTransDisabled: false), totalBalance: 3000, thisMonthBudget: 3000, thisMonthExpense: 2000)
    
    @Published var liabilitiesAccount = LiabilitiesAccount(cardInfo: CardInfo(accountType: .Liabilities, cardNumber: generateCreditCardNumber(for: .Visa), cardCVV: generateCVV(), cardExpDate: "12/10"), cardSetting: CardSetting(cardLimit: 0, isCardLocked: false, isEcommerceTransDisabled: false), isNotStable: false, liabilities: [], liabilitiesCost: 0, totalBalance: 0, thisMonthBudget: 0, thisMonthExpense: 0)
    
    @Published var businessAccount = BusinessAccount(cardInfo: CardInfo(accountType: .Business, cardNumber: generateCreditCardNumber(for: .Visa), cardCVV: generateCVV(), cardExpDate: "12/10"), cardSetting: CardSetting(cardLimit: 0, isCardLocked: false, isEcommerceTransDisabled: true), gaols: [:], totalBalance: 0, thisMonthBudget: 0, thisMonthExpense: 0)
    
}
