//
//  SetupInfoView.swift
//  FinanceManagmentApp
//
//  Created by Zahra Majed Alzawad on 18/05/1444 AH.
//

import SwiftUI

struct SetupInfoView: View {

    var body: some View {
        VStack(alignment: .leading, spacing: 15){
        
            Image("Logo")
                .padding(.top)
                .padding(.trailing)
            
            
            ViewTitleDescription(viewTitle: "PAYWISE", viewDescription: "We will need some information to get started")
                .padding(.leading)

        HStack{
            Text("1")
                .foregroundColor(.white)
                .padding(9)
                .background(Color("AccentPurpleLight"))
                .clipShape(Circle())
                .padding(.leading)

            
            Text("Basic Information")
                .frame(maxWidth: .infinity, alignment: .leading)
            .bold() }
            
        Text("Give us your phone number and wait for the magic! We will provide you with information, and you only have to amend it in case of error")
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(.leading)
    
//    Spacer()
          .frame(height: 85)
            HStack{
                
                Text("2")
                    .foregroundColor(Color("AccentPurpleLight"))

                    .padding(9)
                    .background(.white)
                    .clipShape(Circle())
                    .padding(.leading)

                Text("Financial Information")
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .foregroundColor(Color("grayText"))


                
            }
            LargeButton(text: "Start", isfilled: true) {
               
            }
            .padding(.leading)
            Spacer()
        }
    }
}

struct SetupInfoView_Previews: PreviewProvider {
    static var previews: some View {
        SetupInfoView()
    }
}
