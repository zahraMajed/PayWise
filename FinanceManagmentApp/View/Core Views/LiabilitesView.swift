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
    
    var body: some View {
        VStack {
            
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
