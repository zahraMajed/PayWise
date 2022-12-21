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
                Text("$ 53,405.08")
                    .bold()
            }.padding(.top, 17)
            
            VStack (alignment: .leading,spacing: 10){
                Text("Sep Budget")
                Text("$ 3,300")
                    .bold()
            }
            
            VStack (alignment: .leading,spacing: 10){
                Text("Sep Expanse")
                Text("$ 2,300")
                    .bold()
            }
            
            if currentCard.accountType == .Liabilities {
                VStack (alignment: .leading,spacing: 10){
                    Text("Liabilities Cost")
                    Text("$ 2,300")
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

