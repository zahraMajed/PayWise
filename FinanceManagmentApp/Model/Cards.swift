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
    var cardNumber: String
    var cardCVV: String
    var cardExpDate: String
    var cardName: String {
        switch accountType {
        case .Personal:
            return "Persoanl Card"
        case .Business:
            return "Liability Card"
        case .Liabilities:
            return "Business Card"
        }
    }
    var cardColor :String {
        switch accountType {
        case .Personal:
            return "Gray1"
        case .Business:
            return "AccentPurpleLight"
        case .Liabilities:
            return "PrimaryBlueLight"
        }
    }
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

enum CreditCardNumberType {
    case Visa
    case Visa13Digit
    case MasterCard
    case Discover
    case AmericanExpress
    case DinersClubUSA
    case DinersClubCanada
    case DinersClubInternational
    case DinersClubCarteBlanche
    case JCB
}

func generateCreditCardNumber(for type: CreditCardNumberType) -> String{
    /* Obtain proper card length */
    var cardLength = (type == .Visa13Digit) ? 13 : 16
    cardLength = (type == .AmericanExpress) ? 15 : cardLength
    cardLength = (type == .DinersClubInternational || type == .DinersClubCarteBlanche) ? 14 : cardLength
    
    var cardNumber = [Int](repeating: 0, count: cardLength)
    var startingIndex = 0
    
    /* Conform to rules for beginning card numbers */
    if type == .Visa || type == .Visa13Digit {
        cardNumber[0] = 4
        startingIndex = 1
    }
    else if type == .MasterCard {
        cardNumber[0] = 5
        cardNumber[1] = Int(arc4random_uniform(5) + 1)
        startingIndex = 2
    }
    else if type == .Discover {
        cardNumber.replaceSubrange(Range(0...3), with: [6,0,1,1])
        startingIndex = 4
    }
    else if type == .AmericanExpress {
        cardNumber.replaceSubrange(Range(0...1), with: [3,4])
        startingIndex = 2
    }
    else if type == .DinersClubUSA || type == .DinersClubCanada {
        //Will most often pass as a master card because of the 54
        cardNumber.replaceSubrange(Range(0...1), with: [5,4])
        startingIndex = 2
    }
    else if type == .DinersClubInternational {
        cardNumber.replaceSubrange(Range(0...1), with: [3,6])
        startingIndex = 2
    }
    else if type == .DinersClubCarteBlanche {
        cardNumber.replaceSubrange(Range(0...2), with: [3,0,0])
        startingIndex = 3
    }
    else if type == .JCB {
        cardNumber.replaceSubrange(Range(0...3), with: [3,5,2,8])
        startingIndex = 4
    }
    
    /* Fill array with random numbers 0-9 */
    for i in startingIndex..<cardNumber.count{
        cardNumber[i] = Int(arc4random_uniform(10))
    }
    
    /* Calculate the final digit using a custom variation of Luhn's formula
       This way we dont have to spend time reversing the array
     */
    let offset = (cardNumber.count+1)%2
    var sum = 0
    for i in 0..<cardNumber.count-1 {
        if ((i+offset) % 2) == 1 {
            var temp = cardNumber[i] * 2
            if temp > 9{
                temp -= 9
            }
            sum += temp
        }
        else{
            sum += cardNumber[i]
        }
    }
    let finalDigit = (10 - (sum % 10)) % 10
    cardNumber[cardNumber.count-1] = finalDigit
    
    //Convert cardnumber array to string
    return cardNumber.map({ String($0) }).joined(separator: "")
}



