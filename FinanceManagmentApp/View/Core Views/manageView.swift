//
//  manageView.swift
//  FinanceManagmentApp
//
//  Created by ashwaq almuzaini on 24/05/1444 AH.
//

import SwiftUI

struct manageView: View {
    
    @State private var isOn1 :Bool = true
    @State private var isOn2 :Bool = true
    @State private var limit :String = ""
    @EnvironmentObject var userData : User
    var body: some View {
        
        VStack(spacing:17){
            Spacer()
            CustomTextField(textFieldLabel: "Set a limit", textFieldHint: "$ 3,300", isSwitch: true, isCurrancy: true, userInput: $limit)
                .keyboardType(.namePhonePad)
            
            ZStack{
               
                RoundedRectangle(cornerRadius: 14)
                    .foregroundColor(Color("Gray4"))
                
                HStack{
                    
                    VStack(alignment: .leading){
                        Text("Lock card")
                            .font(.subheadline)
                            .foregroundColor(Color("Gray2"))
                            .padding([.top, .leading, .trailing], 12)
                            .padding(.bottom, 5)
                        
                        Text("Temporarily suspand your card")
                            .font(.subheadline)
                            .foregroundColor(Color.black)
                            .padding([.leading, .bottom, .trailing], 12)
                    }
                    
                    Toggle("", isOn: $userData.personalAccount.cardSetting.isCardLocked)
                        .tint(Color("AccentGreenLight"))
                        .padding()
                
                }
            }
            .frame(width: 355, height: 65)
            .cornerRadius(14)
            
            ZStack{
                
                RoundedRectangle(cornerRadius: 14)
                    .foregroundColor(Color("Gray4"))
                
                HStack{
                    
                    VStack(alignment: .leading){
                        Text("E-commerce transaction")
                            .font(.subheadline)
                            .foregroundColor(Color("Gray2"))
                            .padding([.top, .leading, .trailing], 12)
                            .padding(.bottom, 5)
                        
                        Text("Disable E-commerce Transaction")
                            .font(.subheadline)
                            .foregroundColor(Color.black)
                            .padding([.leading, .bottom, .trailing], 12)
                    }
                    
                    Toggle("", isOn: $userData.personalAccount.cardSetting.isEcommerceTransDisabled)
                        .tint(Color("AccentGreenLight"))
                        .padding()
                
                }
            }
            .frame(width: 355, height: 65)
            .cornerRadius(14)

            
            
        }
       }
    
}
                                        

    


struct manageView_Previews: PreviewProvider {
    static var previews: some View {
        manageView()
            .environmentObject(User())
    }
}
