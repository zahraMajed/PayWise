//
//  AccountView.swift
//  FinanceManagmentApp
//
//  Created by Zahra Majed Alzawad on 24/05/1444 AH.
//

import SwiftUI

struct AccountView: View {
    //MARK: vars
    var currentCard: CardInfo
    @EnvironmentObject var userData : User
    @State var selectedOption = AccountServicesSegmentedPicker.accountServicesOptions.transactions
    
    //MARK: var
    var body: some View {
        VStack {
            CardDesign(cardInfo: currentCard)
            AccountServicesSegmentedPicker(currentAccountType: currentCard.accountType, selectedOption: $selectedOption)
            ScrollView (showsIndicators: false){
                containedView(selectedOption: selectedOption)
            }
        }
    }
    //MARK: functions
    func containedView(selectedOption: AccountServicesSegmentedPicker.accountServicesOptions) ->  AnyView {
        switch selectedOption {
        case .transactions:
             return AnyView(TransactionsView())
        case .manage:
            return AnyView(manageView())
        case .detailes:
            return AnyView(DetailsView())
        case .goals:
            return AnyView(goalView())
        case .liabilities:
            return AnyView(LiabilitesView())
        }
    }

}

struct AccountView_Previews: PreviewProvider {
    static var previews: some View {
        AccountView(currentCard: CardInfo(accountType: .Liabilities, cardNumber: "", cardCVV: "", cardExpDate: ""))
            .environmentObject(User())
    }
}
