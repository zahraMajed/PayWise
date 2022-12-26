//
//  DetailsView.swift
//  FinanceManagmentApp
//
//  Created by Reema Alsheddi on 19/12/2022.
//

import SwiftUI


struct DetailsView: View {
    @EnvironmentObject var userData : User
    var currentCard: CardInfo
    var body: some View {
        VStack(alignment: .leading, spacing: 20){
            
            VStack (alignment: .leading,spacing: 10){
                Text("Total Balance")
                Text("4,000 SR")
                    .bold()
            }.padding(.top, 17)
            
            VStack (alignment: .leading,spacing: 10){
                Text("Sep Budget")
                Text("4,000 SR ")
                    .bold()
            }
            
            VStack (alignment: .leading,spacing: 10){
                Text("Sep Expanse")
                Text("0,000 SR")
                    .bold()
            }
            
            if currentCard.accountType == .Liabilities {
                VStack (alignment: .leading,spacing: 10){
                    Text("Liabilities Cost")
                    Text("2,000 SR")
                        .bold()
                }
            }
            
            VStack{
                
            }.frame(width: 355)
        }
    }
}

struct DetailsView_Previews: PreviewProvider {
    static var previews: some View {
        DetailsView(currentCard: CardInfo(accountType: .Liabilities, cardNumber: "", cardCVV: "", cardExpDate: ""))
            .environmentObject(User())
    }
}

