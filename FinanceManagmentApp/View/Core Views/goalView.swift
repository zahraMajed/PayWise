//
//  goalView.swift
//  FinanceManagmentApp
//
//  Created by Shaden on 27/05/1444 AH.
//

import SwiftUI
 

struct goalView: View {
    @EnvironmentObject var userData : User
    
    struct Item: Identifiable, Hashable {
        var id: String {
            return key.description + value.description
        }
        
        let key: Int
        let value: String
        
        func hash(into hasher: inout Hasher) {
            hasher.combine(id)
        }
    }
    
    var body: some View {
        VStack(alignment: .leading){
            Spacer()
            //ViewTitleDescription(viewTitle: "Goal tracker", viewDescription: "")
                //.offset(x:15)
                        ForEach(userData.businessAccount.gaols.map { key, value in Item(key: key, value: value)}, id: \.self) { item in

                            Text("\(item.value)")
                                .font(.title3)
                                .fontWeight(.light)
                            if item.key != 2 {
                                ZStack(alignment: .leading){
                                    RoundedRectangle(cornerRadius: 20)
                                        .foregroundColor(Color("Gray4"))
                                    .frame(width: 300,height: 10)

                                    RoundedRectangle(cornerRadius: 20)
                                        .foregroundColor(Color("Gray3"))
                                    .frame(width: 50,height: 10)
                                }
                                Text("you ")
                            }

                        }.padding([.leading, .trailing], 17.0)
            
                            
            if userData.businessAccount.gaols[2] != nil {
                ViewTitleDescription(viewTitle: "Recommendations", viewDescription: "")
                    .offset(x:15)

                VStack(alignment: .center){
                    Image("Image1")

                        .resizable()
                        .frame(width: 370, height: 70)
                    Image("Image2")
                        .resizable()
                        .frame(width: 370, height: 70)
                }
                .offset(x:10)
            }
            
        }
        
        
        
    }
    
}
        

        
    
struct goalView_Previews: PreviewProvider {
    static var previews: some View {
        goalView()
            .environmentObject(User())
    }
}
