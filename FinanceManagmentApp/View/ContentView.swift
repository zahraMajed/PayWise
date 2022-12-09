//
//  ContentView.swift
//  FinanceManagmentApp
//
//  Created by Zahra Majed Alzawad on 14/05/1444 AH.
//

import SwiftUI

struct ContentView: View {
    @State private var username: String = ""
    @State private var selectedDate: Date = Date.now
    
        var body: some View {
        VStack {

            CustomTextField(textFieldLabel: "Name", textFieldHint: "Enter Your name", isSwitch: false, userInput: $username).padding()
            
            CustomTextFieldWithDate(textFieldLabel: "Date of Bitrh", datePickerTitle: "Date of birth", selectedDate: $selectedDate).padding()
            
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
