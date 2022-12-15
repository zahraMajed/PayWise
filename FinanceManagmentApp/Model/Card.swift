//
//  Card.swift
//  FinanceManagmentApp
//
//  Created by Reema Alsheddi on 15/12/2022.
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

struct CardInfo {
    var cardNumber: String
    var cvv: String
    var expDate: String
}

struct CardSetting {
    var cardLimit: Int
    var isCardLocked: Bool
    var isEcommerceTransDisabled: Bool
}
