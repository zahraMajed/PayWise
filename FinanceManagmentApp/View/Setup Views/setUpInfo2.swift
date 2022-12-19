//
//  setUpInfo2.swift
//  FinanceManagmentApp
//
//  Created by Reema Alsheddi on 19/12/2022.
//

import SwiftUI

struct setUpInfo2: View {

    var body: some View {
        VStack(alignment: .leading, spacing: 15){
        
            Image("Logo")
                .padding(.top)
                .padding(.trailing)
            
            
            ViewTitleDescription(viewTitle: "PAYWISE", viewDescription: "We will need some information to get started")
                .padding(.leading)

        HStack{
            Text("1")
                .foregroundColor(Color("AccentPurpleLight"))
                .padding(9)
                .background(.white)
                .clipShape(Circle())
                .padding(.leading)

            
            Text("Basic Information")
                .frame(maxWidth: .infinity, alignment: .leading)
                .foregroundColor(Color("grayText"))

            .bold() }
            
 
          .frame(height: 85)
            HStack{
                
                Text("2")
                    .foregroundColor(.white)
                    .padding(9)
                    .background(Color("AccentPurpleLight"))
                    .clipShape(Circle())
                    .padding(.leading)
            
                Text("Financial Information")
                    .frame(maxWidth: .infinity, alignment: .leading)
            }
            Text("Share with us a little bit of your financial information so that we can develop an appropriate financial strategy. All your data will be secure. ")
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.leading)
            LargeButton(text: "Start", isfilled: true) {
               
            }
            .padding(5)
            .padding(.leading)
            Spacer()
        }
    }
}

struct setUpInfo2_Previews: PreviewProvider {
    static var previews: some View {
        setUpInfo2()
    }
}
