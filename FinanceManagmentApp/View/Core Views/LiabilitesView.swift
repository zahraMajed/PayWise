//
//  LiabilitesView.swift
//  FinanceManagmentApp
//
//  Created by raghad khalid alsaif on 26/05/1444 AH.
//

import SwiftUI

struct LiabilitesView: View {
    @EnvironmentObject var userData : User
    @State private var editinglidt = false
    @State private var liabilityCost: String = ""
    @State private var showNextView : Bool = false
    
    
    var body: some View {
        VStack {
            
        
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
            
            
            LargeButton(text: "Add liability", isfilled: true) {
                showNextView = true
            }
            .padding(.bottom, 20)
            
            NavigationLink(destination: RecurringLiabilitiesView(), isActive: $showNextView) {
            }.labelsHidden()
        }
        
    }
    //MARK: function
    func deleteLiabilitie(indexSet : IndexSet){
        userData.liabilitiesAccount.liabilities.remove(atOffsets: indexSet)
    }
  
    func moveLiabilitie(fromOffsets source: IndexSet, toOffsets destination : Int){
        userData.liabilitiesAccount.liabilities.move(fromOffsets: source, toOffset: destination)
        withAnimation{
            editinglidt = false
        }
        
    }

}

struct LiabilitesView_Previews: PreviewProvider {
    static var previews: some View {
        LiabilitesView()
            .environmentObject(User())
    }
}
