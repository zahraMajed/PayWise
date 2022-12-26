//
//  RecurringLiabilitiesView.swift
//  FinanceManagmentApp
//
//  Created by raghad khalid alsaif on 24/05/1444 AH.
//

import SwiftUI

struct RecurringLiabilitiesView: View {
    //MARK: vars
    @EnvironmentObject var userData : User
    @State private var liabilityName: String = ""
    @State private var liabilityCost: String = ""
    @State private var showNextView : Bool = false
    @State private var editinglidt = false
    
    //MARK: body
    var body: some View {
        ZStack {
            VStack(){
                Spacer()
                ViewTitleDescription(viewTitle: "Recurring Liabilities", viewDescription: "The Liability Card will be managed according to your input")
                Spacer(minLength: 100)
                VStack(spacing: 17){
                    CustomTextField(textFieldLabel: "Liability name", textFieldHint: "Car installments", isSwitch: false, isCurrancy: false, userInput: $liabilityName)
                    
                    CustomTextField(textFieldLabel: "Liability Cost", textFieldHint: "1,000 SR", isSwitch: false, isCurrancy: true, userInput: $liabilityCost)
                        .keyboardType(.namePhonePad)
                    
                    LargeButton(text: "Add liability", isfilled: false) {
                        userData.liabilitiesAccount.liabilities.append(Liabilities(liabilityName: liabilityName, liabilityCost: liabilityCost))
                        if let liabCost = Int(liabilityCost) {
                            userData.liabilitiesAccount.liabilitiesCost += liabCost
                        }
                        if let montlyIncom = Int(userData.monthlyIncom)  {
                            if userData.liabilitiesAccount.liabilitiesCost > (montlyIncom/3) {
                                userData.liabilitiesAccount.isNotStable = true
                            }
                        }
                    }
                }
                                    
                List{
                    ForEach(userData.liabilitiesAccount.liabilities, id: \.self) { liability in
                        listRow(liability: liability)

                    }
                    .onDelete(perform: deleteLiabilitie)
                     .onMove(perform: moveLiabilitie)
                     .onLongPressGesture{
                     withAnimation{
                     self.editinglidt = true
                     }
                     }
                     .environment(\.editMode, editinglidt ?.constant(.active): .constant(.inactive))
                    .listRowSeparator(.hidden)
                }
                .padding(.bottom, 17.0)
                .frame(maxHeight: 200)
                .listStyle(.plain)
                
                if userData.liabilitiesAccount.liabilitiesCost > 0 {
                    HStack{
                        Text("Total liabilities Cost:")
                            .font(.headline)
                        Text("\(userData.liabilitiesAccount.liabilitiesCost)")
                        Spacer()
                    }
                    .padding(.leading, 17)
                }
                Spacer()
                
                LargeButton(text: "Continue", isfilled: true) {
                    showNextView = true
                }
                .padding(.bottom, 20)
                
                NavigationLink(destination: MoneyGrowthGoal(), isActive: $showNextView) {
                }.labelsHidden()
            }
            
            if userData.liabilitiesAccount.isNotStable {
                CustomAlert(presentAlert: $userData.liabilitiesAccount.isNotStable, alertType: .error(title: "Prioritize", message: "We recommend you reduce liabilities and prioritize"))
            }
        }
    }
    //MARK: function
    func deleteLiabilitie(indexSet : IndexSet){
       // userData.liabilitiesAccount.liabilitiesCost = Int(userData.liabilitiesAccount.liabilities.)
        userData.liabilitiesAccount.liabilities.remove(atOffsets: indexSet)
       
    }
  
    func moveLiabilitie(fromOffsets source: IndexSet, toOffsets destination : Int){
        userData.liabilitiesAccount.liabilities.move(fromOffsets: source, toOffset: destination)
        withAnimation{
            editinglidt = false
        }
        
    }
}

struct RecurringLiabilitiesView_Previews: PreviewProvider {
    static var previews: some View {
        RecurringLiabilitiesView()
            .environmentObject(User())
    }
}
