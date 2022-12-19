//
//  DetailsView.swift
//  FinanceManagmentApp
//
//  Created by Reema Alsheddi on 19/12/2022.
//

import SwiftUI


struct DetailsView: View {

    var body: some View {
        
        Spacer()
        VStack(alignment: .leading, spacing: 15){
        
            
            Text("Total Balance")
                .padding(.leading)
            Text("$ 53,405.08")
                .bold()
                .padding(.leading)
            
            
            Text("Sep Budget")
                .padding(.leading)
            Text("$ 3,300")
                .bold()
                .padding(.leading)
            
          
            Text("Sep Expanse")
                .padding(.leading)
            Text("$ 2,300")
                .bold()
                .padding(.leading)
            
           
        }
    }
}

struct DetailsView_Previews: PreviewProvider {
    static var previews: some View {
        DetailsView()
    }
}

