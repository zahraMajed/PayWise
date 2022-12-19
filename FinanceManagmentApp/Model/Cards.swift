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
    var liabilities : [Liabilities]
    var liabilitiesCost : Int
    var totalBalance : Int
    var thisMonthBudget : Int
    var thisMonthExpense : Int
}

struct CardInfo: Identifiable {
    //all these data should be computed proporty
    var id = UUID().uuidString
    var accountType : accountType
    var cardName: String
    var cardNumber: String
    var cardCVV: String
    var cardColor :String
    var cardExpDate: String
}

enum accountType : String {
    case Personal
    case Business
    case Liabilities
}

struct Liabilities: Identifiable, Hashable{
    var id = UUID()
    var liabilityName : String
    var liabilityCost : String
}

struct CardSetting {
    var cardLimit: Int
    var isCardLocked: Bool
    var isEcommerceTransDisabled: Bool
}

struct BusinessAccount {
    var cardInfo : CardInfo
    var cardSetting : CardSetting
    //var transactions : Transactions
    var gaols : [Int:String]
    var totalBalance : Int
    var thisMonthBudget : Int
    var thisMonthExpense : Int
    var businessCost : Int?
    var businessDueDate : Date = Date.now
    //var currenProgress
    
}



