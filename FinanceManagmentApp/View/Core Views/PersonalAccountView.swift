//
//  PersonalAccountView.swift
//  FinanceManagmentApp
//
//  Created by Zahra Majed Alzawad on 21/05/1444 AH.
//

import SwiftUI

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

struct PersonalAccountView: View {
    //MARK: vars
    var currentCard: CardInfo
    @EnvironmentObject var userData : User
    @State var selectedOption = AccountServicesSegmentedPicker.accountServicesOptions.transactions
    
    //MARK: body
    var body: some View {
        VStack {
            CardDesign(cardInfo: currentCard)
            AccountServicesSegmentedPicker(currentAccountType: currentCard.accountType, selectedOption: $selectedOption)
                TransactionsView()
                
            }
        .onChange(of: selectedOption) { newOption in
            print(newOption)
            print(selectedOption)
            /*switch newOption {
            case .transactions:
                //getTransactions()
            case .manage:
                //showManage()
            case .detailes:
                //showDetailes()
            case .goals:
                //showGoals()
            case .liabilities:
                //showliabilities()
            }*/
        }
    }
}

struct PersonalAccountView_Previews: PreviewProvider {
    static var previews: some View {
        PersonalAccountView(currentCard: CardInfo(accountType: .Personal, cardName: "", cardNumber: "", cardCVV: "", cardColor: "", cardExpDate: ""))
            .environmentObject(User())
    }
}
