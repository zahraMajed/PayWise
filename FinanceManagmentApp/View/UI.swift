//
//  UI.swift
//  FinanceManagmentApp
//
//  Created by Zahra Majed Alzawad on 14/05/1444 AH.
//

import Foundation
import SwiftUI

//MARK: Buttons
struct LargeButton: View {
    var text: String
    var isfilled: Bool
    var clicked: (() -> Void)
    
    var body: some View {
        Button(action: clicked) {
            Text(text)
                .font(.headline)
                .fontWeight(.semibold)
                .foregroundColor(isfilled ? Color.white : Color("AccentGreenLight"))
                .background(Color( isfilled ? "AccentGreenLight" : "AccentGreenVariantLight")
                    .cornerRadius(14)
                    .frame(width: 355, height: 43))
        }
    }
}

struct MediumButton: View {
    var text: String
    var isfilled: Bool
    var clicked: (() -> Void)
    
    var body: some View {
        Button(action: clicked) {
            Text(text)
                .font(.headline)
                .fontWeight(.semibold)
                .foregroundColor(isfilled ? Color.white : Color("AccentGreenLight"))
                .background(Color( isfilled ? "AccentGreenLight" : "AccentGreenVariantLight")
                    .cornerRadius(14)
                    .frame(width: 200, height: 43))
        }
    }
}

struct PlainButton: View {
    var text: String
    var clicked: (() -> Void)
    
    var body: some View {
        Button(action: clicked) {
            Text(text)
                .font(.headline)
                .fontWeight(.semibold)
                .foregroundColor(Color("AccentGreenLight"))
                .padding(20)
        }
    }
}

//MARK: Text Field


struct CustomTextField: View {
    
    var textFieldLabel: String
    var textFieldHint: String
    @State private var userInput: String
    var isData: Bool
    var isSwitch: Bool
    var clicked: (() -> Void)
    
    var body: some View {
        VStack(alignment: .leading){
            Text("textFieldLabel")
                .font(.subheadline)
                .foregroundColor(Color("Gray2"))
                .padding([.top, .leading, .trailing], 12)
                .padding(.bottom, 5)
            TextField("textFieldHint", text: $userInput)
                .disableAutocorrection(true)
                .foregroundColor(Color.black)
                .padding([.leading, .bottom, .trailing], 12)
        }
        .background(Color("Gray4"))
        .cornerRadius(14)
        .frame(width: 355, height: 65)
    }
}


