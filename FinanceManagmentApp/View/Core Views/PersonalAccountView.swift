//
//  PersonalAccountView.swift
//  FinanceManagmentApp
//
//  Created by Zahra Majed Alzawad on 21/05/1444 AH.
//

import SwiftUI

struct CardInfo: Identifiable {
    var id = UUID().uuidString
    var cardType: String
    var cardNumber: String
    var cardCVV: String
    var cardColor :String
    var cardExpDate: String
}

struct PersonalAccountView: View {
    //MARK: vars
    var currentCard: CardInfo
    @EnvironmentObject var userData : User
    @State var selectedOption = AccountServicesSegmentedPicker.accountServicesOptions.transactions
    
    //MARK: body
    var body: some View {
        VStack {
            CardDesign2(cardType: "Personal Card", cardNumber: userData.personalAccount.cardInfo.cardNumber, cardCVV: userData.personalAccount.cardInfo.cardCVV, cardColor: userData.personalAccount.cardInfo.cardColor, cardExpDate: userData.personalAccount.cardInfo.cardExpDate) {
                
            }
                AccountServicesSegmentedPicker(currentAccountType: .Personal, selectedOption: $selectedOption)
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
        PersonalAccountView(currentCard: CardInfo(cardType: "", cardNumber: "", cardCVV: "", cardColor: "", cardExpDate: ""))
            .environmentObject(User())
    }
}

struct CardDesign2 : View {
    
    //MARK: vars
    var cardType: String
    var cardNumber: String
    var cardCVV: String
    var cardColor: String
    var cardExpDate: String
    var isEyeClicked: (() -> Void)
    var isEyeHiddin : Bool = true
    
    //MARK: body
    var body: some View {
        VStack(spacing: 30) {
                HStack {
                    Text(cardType)
                        .font(.headline)
                        .fontWeight(.semibold)
                        .foregroundColor(.white)
                        Spacer()
                    if !isEyeHiddin {
                        Button(action: isEyeClicked) {
                            Image(systemName: "eye")
                        }
                        .foregroundColor(.white)
                        
                    }
                }
                .padding(15)
                Text(cardNumber)
                .font(.title)
                .fontWeight(.regular)
                .foregroundColor(.white)
                .padding(15)
                HStack{
                    Text("Exp: \(cardExpDate)")
                        .font(.headline)
                        .fontWeight(.regular)
                        .foregroundColor(.white)
                        
                    Spacer()
                    Text("CVV: \(cardCVV))")
                        .font(.headline)
                        .fontWeight(.regular)
                        .foregroundColor(.white)
                        
                }.padding(15)
            }
        // here we add .offset
        //.offset(y: 40)
            .frame(width: 358, height: 224)
            .background(Color(cardColor))
            .cornerRadius(12)
    }
    
   
}
