//
//  WalletHome.swift
//  FinanceManagmentApp
//
//  Created by Reema Alsheddi on 15/12/2022.
//

import SwiftUI


struct WalletHome: View {
    //MARK: vars
    @EnvironmentObject var userData : User
    @State var expandCards: Bool = false
    
    var body: some View {
        
        VStack(spacing: 0){
            
            Text("Wallet")
                .font(.largeTitle)
                .fontWeight(.semibold)
                .padding(.horizontal,15)
                .padding(.bottom,10)
            
            ScrollView(.vertical, showsIndicators: false) {
                
                VStack(spacing: 0){
                    /*CardDesign1(cardType: "Personal Card", cardNumber: userData.personalAccount.cardInfo.cardNumber, cardCVV: userData.personalAccount.cardInfo.cvv, cardColor: userData.personalAccount.cardInfo.cardColor, cardExpDate: userData.personalAccount.cardInfo.expDate) {

                    }
                    .padding(15)

                    CardDesign1(cardType: "Liabilities Account", cardNumber: userData.liabilitiesAccount.cardInfo.cardNumber, cardCVV: userData.liabilitiesAccount.cardInfo.cvv, cardColor: userData.liabilitiesAccount.cardInfo.cardColor, cardExpDate: userData.liabilitiesAccount.cardInfo.expDate) {
                        
                    }
                    .padding(15)
                    

                    CardDesign1(cardType: "Business Card", cardNumber: "", cardCVV: "", cardColor: "AccentPurpleLight", cardExpDate: "") {
                        
                    }
                    .padding(15)*/

                } .overlay {
                    Rectangle()
                        .fill(.black.opacity(expandCards ? 0 : 0.01))
                        .onTapGesture {
                            withAnimation(.easeInOut(duration: 0.35)){
                                expandCards = true
                            }
                        }
                }
                .padding(.top,expandCards ? 30 : 0)
            }
            .coordinateSpace(name: "SCROLL")
            .offset(y: expandCards ? 0 : 30)
        }
        }
    
    //MARK: functions
    func getCards() -> [CardDesign1] {
        return [CardDesign1(cardType: "Personal Card", cardNumber: userData.personalAccount.cardInfo.cardNumber, cardCVV: userData.personalAccount.cardInfo.cvv, cardColor: userData.personalAccount.cardInfo.cardColor, cardExpDate: userData.personalAccount.cardInfo.expDate) {
            
        }, CardDesign1(cardType: "Liabilities Account", cardNumber: userData.liabilitiesAccount.cardInfo.cardNumber, cardCVV: userData.liabilitiesAccount.cardInfo.cvv, cardColor: userData.liabilitiesAccount.cardInfo.cardColor, cardExpDate: userData.liabilitiesAccount.cardInfo.expDate) {
            
        }, CardDesign1(cardType: "Business Card", cardNumber: "", cardCVV: "", cardColor: "AccentPurpleLight", cardExpDate: "") {
        }]
    }
}



struct WalletHome_Previews: PreviewProvider {
    static var previews: some View {
        WalletHome()
            .environmentObject(User())
    }
}
