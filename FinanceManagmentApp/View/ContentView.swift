//
//  ContentView.swift
//  FinanceManagmentApp
//
//  Created by Zahra Majed Alzawad on 14/05/1444 AH.
//

import SwiftUI

struct ContentView: View {
    @State private var username: String = ""
        var body: some View {
        VStack {
            LargeButton(text: "heelo", isfilled: true) {
                print("")
            }
            
            VStack(alignment: .leading){
                Text("textFieldLabel")
                    .font(.subheadline)
                    .foregroundColor(Color("Gray2"))
                    .padding([.top, .leading, .trailing], 12)
                    .padding(.bottom, 5)
                TextField("textFieldHint", text: $username)
                    .disableAutocorrection(true)
                    .foregroundColor(Color.black)
                    .padding([.leading, .bottom, .trailing], 12)
            }
            .background(Color("Gray4"))
            .cornerRadius(14)
            .frame(width: 355, height: 65)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
