//
//  MoneyGrowthGoal.swift
//  FinanceManagmentApp
//
//  Created by raghad khalid alsaif on 21/05/1444 AH.
//


import SwiftUI

struct MoneyGrowthGoal: View {
    @State private var BusinessCost: String = ""
    @State private var selectedDate : Date = Date.now
    @State private var showSheet : Bool = false

    var body: some View {
        NavigationView{
            VStack(spacing: 40){
                Text("The Business Card will be managed according to your choice")
                    .multilineTextAlignment(.leading)
                    .font(.system(size: 18, weight: .light, design: .serif))
                
                
                ZStack{

        Rectangle()
                        .fill(Color(red: 0.9215686274509803, green: 0.9215686274509803, blue: 0.9215686274509803))
                    .frame(width: 350, height: 150)
                    .cornerRadius(15)
                    
                    
                    VStack(alignment: .leading){
                        Text("Goals to grow your money")
                            .foregroundColor(Color(red: 0.6039215686274509, green: 0.6039215686274509, blue: 0.6039215686274509))
                            .font(.system(size: 18, weight: .light, design: .serif))
                            .padding(.bottom)
                            .padding(.trailing,20)
                        CheckView(title: "Opening new business")
                            .font(.system(size: 20,weight: .light,design: .default))
                            
                        
                        CheckView(title: "Stock trading")
                            .font(.system(size: 20,weight: .light,design: .default))
                     
                    }
                    .padding(.bottom,30)
                    .padding(.trailing,80)
            }
             
                
                
                // text field for the Business Cost
                CustomTextField(textFieldLabel: "Business Cost", textFieldHint: "$ 50,000.00", isSwitch: false, isCurrancy: false, userInput: $BusinessCost).padding()
                
                // text field for the Business opening date
                CustomTextFieldWithDate(textFieldLabel: "Business opening date", datePickerTitle: "Business opening date", selectedDate: $selectedDate).padding()
                
                Button(action: {
                    showSheet.toggle()
                    
                }, label: {
                    LargeButton2(text: "Create Account", isfilled: true)
                        .labelsHidden()
                })
                
                Spacer()
            } .navigationBarTitle("Money Growth Goal")
                .padding()
                .frame(maxWidth: .infinity, maxHeight: .infinity)
            
        }
        .fullScreenCover(isPresented: $showSheet) {
            SetupInfoView()
        }
            
        }
        
    }


struct MoneyGrowthGoal_Previews: PreviewProvider {
    static var previews: some View {
        MoneyGrowthGoal()
    }
}
