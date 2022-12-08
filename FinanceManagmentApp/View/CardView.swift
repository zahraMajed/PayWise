//
//  CardView.swift
//  FinanceManagmentApp
//
//  Created by Zahra Majed Alzawad on 14/05/1444 AH.
//

import SwiftUI

struct CardView: View {
    
    @State var isSelected: Bool = false
    //@State var cardTypes = [1:"Personal card", 2:"Business card", 2:"Liabilities card"]
    
    var body: some View {
        VStack(alignment: .leading) {
          
           // Spacer()
            Text("Business Card")
                .foregroundColor(isSelected ? .white : .black)
                .font(.caption)
                .padding(.bottom, 5)
            HStack(alignment: .center){
                Text("USD")
                    .foregroundColor(isSelected ? .white : .black)
                    .font(.caption)
                Text("$17,370.52")
                    .foregroundColor(isSelected ? .white : .black)
                    .font(.headline)
                    .fontWeight(.heavy)
            }
            .padding(.bottom)
            Text("**** **** **** 3022")
                .foregroundColor(isSelected ? .white : .black)
                .font(.caption)
                .padding(.bottom)
        }
        .frame(width: 358, height: 224)
        .background(Color(isSelected ? #colorLiteral(red: 0.3097526431, green: 0.3843510449, blue: 0.7528470159, alpha: 1) : .white))
        .cornerRadius(12)
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView(isSelected: true)
    }
}
