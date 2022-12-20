//
//  AddToWalletView.swift
//  FinanceManagmentApp
//
//  Created by Zahra Majed Alzawad on 24/05/1444 AH.
//

import SwiftUI
import PassKit
import UIKit

struct AddToWalletView: View {
    @EnvironmentObject var userData : User
    @State private var showNextView : Bool = false
    var body: some View {
        VStack {
            Spacer()
            Text("Add your personal card to your apple wallet")
                .font(.title)
                .fontWeight(.bold)
            Spacer(minLength: 142)
            CardDesign(cardInfo: userData.personalAccount.cardInfo)
            Spacer(minLength: 100)
            AddToWalletBtn()
                .frame(width: 355, height: 43)
            
            PlainButton(text: "Maybe Later") {
                showNextView = true
            }
            Spacer()
            NavigationLink(destination: AddToWalletView2(), isActive: $showNextView) {
            }.labelsHidden()
        }
    }
}

struct AddToWalletView_Previews: PreviewProvider {
    static var previews: some View {
        AddToWalletView()
            .environmentObject(User())
    }
}

struct AddToWalletBtn: UIViewRepresentable {
    
    func makeUIView(context: Context) -> UIButton {
        let passButton = PKAddPassButton(addPassButtonStyle: PKAddPassButtonStyle.black)
        return passButton
    }
    
    func updateUIView(_ uiView: UIButton, context: Context) {
        
    }
    
    typealias UIViewType = UIButton

}
