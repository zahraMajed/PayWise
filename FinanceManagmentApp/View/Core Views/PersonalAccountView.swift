//
//  PersonalAccountView.swift
//  FinanceManagmentApp
//
//  Created by Zahra Majed Alzawad on 21/05/1444 AH.
//

import SwiftUI

struct PersonalAccountView: View {
    //MARK: vars
    @EnvironmentObject var userData : User
    @State var selectedOption = AccountServicesSegmentedPicker.accountServicesOptions.transactions
    //MARK: body
    var body: some View {
        ScrollView(.vertical) {
            AccountServicesSegmentedPicker(currentAccountType: .Personal, selectedOption: $selectedOption)
            TransactionsView()
        }.onChange(of: selectedOption) { newOption in
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

struct AccountServicesSegmentedPicker: View {
    //MARK: vars
    var currentAccountType : accountType
    @Binding var selectedOption : accountServicesOptions
    
    //MARK: enum
    enum accountType : String {
        case Personal
        case Business
        case Liabilities
    }
    enum accountServicesOptions : String , CaseIterable, Identifiable {
        case transactions = "Transactions"
        case manage = "Manage"
        case detailes = "Detailes"
        case goals = "Goals"
        case liabilities = "Liabilities"
        
        var id: accountServicesOptions { self }
    }
    
    //MARK: body
    var body: some View {
                
         Picker("Account Services", selection: $selectedOption) {
             ForEach(accountServicesOptions.allCases) { option in
                 
                 if option.rawValue != "Goals" && option.rawValue !=  "Liabilities" {
                     Text(option.rawValue)
                 }
                 
                 if currentAccountType == .Business && option.rawValue == "Goals" {
                     Text(option.rawValue)
                 } else if currentAccountType == .Liabilities && option.rawValue == "Liabilities" {
                     Text(option.rawValue)
                 }
             }
         }
         .frame(maxWidth: 358)
         .pickerStyle(SegmentedPickerStyle())
    }
    
}

struct PersonalAccountView_Previews: PreviewProvider {
    static var previews: some View {
        PersonalAccountView()
    }
}
