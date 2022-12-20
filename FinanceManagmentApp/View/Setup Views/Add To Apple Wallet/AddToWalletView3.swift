//
//  AddToWalletView3.swift
//  FinanceManagmentApp
//
//  Created by Zahra Majed Alzawad on 26/05/1444 AH.
//

import SwiftUI

struct AddToWalletView3: View {
    
    @EnvironmentObject var userData : User
    @State private var showNextView : Bool = false
    
    var body: some View {
        VStack {
            Spacer()
            Text("Add your personal card to your apple wallet")
                .font(.title)
                .fontWeight(.bold)
            Spacer(minLength: 142)
            CardDesign(cardInfo: userData.businessAccount.cardInfo)
            Spacer(minLength: 100)
            AddToWalletBtn()
                .frame(width: 355, height: 43)
            
            PlainButton(text: "Maybe Later") {
                showNextView = true
            }
            Spacer()
            NavigationLink(destination: TabMainView(), isActive: $showNextView) {
            }.labelsHidden()
        }

    }
}

struct AddToWalletView3_Previews: PreviewProvider {
    static var previews: some View {
        AddToWalletView3()
            .environmentObject(User())
    }
}
