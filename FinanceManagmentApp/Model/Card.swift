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
    var transactions : Transactions
    var totalBalance : Int
    var thisMonthBudget : Int
    var thisMonthExpense : Int
}

/*struct PersonalAccount {
    var cardInfo : CardInfo
    var cardSetting : CardSetting
    var transactions : Transactions
    var totalBalance : Int
    var thisMonthBudget : Int
    var thisMonthExpense : Int
}*/

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
