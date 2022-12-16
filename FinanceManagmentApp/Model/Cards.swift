//
//  Cards.swift
//  FinanceManagmentApp
//
//  Created by Zahra Majed Alzawad on 22/05/1444 AH.
//

import Foundation


struct PersonalAccount {
    var cardInfo : CardInfo
    var cardSetting : CardSetting
    //var transactions : Transactions
    var totalBalance : Int
    var thisMonthBudget : Int
    var thisMonthExpense : Int
}

struct LiabilitiesAccount {
    var cardInfo : CardInfo
    var cardSetting : CardSetting
    //var transactions : Transactions
    var liabilities : Liabilities
    var liabilitiesCost : Int
    var totalBalance : Int
    var thisMonthBudget : Int
    var thisMonthExpense : Int
}

struct Liabilities {
    var liabilityName : String
    var liabilityCost : Int
}

struct CardSetting {
    var cardLimit: Int
    var isCardLocked: Bool
    var isEcommerceTransDisabled: Bool
}
