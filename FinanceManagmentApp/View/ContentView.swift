//
//  ContentView.swift
//  FinanceManagmentApp
//
//  Created by Zahra Majed Alzawad on 14/05/1444 AH.
//

import SwiftUI
import Firebase

struct ContentView: View {
    @AppStorage("log_Status") var isLoggedIn = false
    @State private var username: String = ""
    @State private var selectedDate: Date = Date.now
    @EnvironmentObject var userData : User
    
        var body: some View {
        VStack {

            CustomTextField(textFieldLabel: "Name", textFieldHint: "Enter Your name", isSwitch: false, isCurrancy: false, userInput: $username).padding()
            
            CustomTextFieldWithDate(textFieldLabel: "Date of Bitrh", datePickerTitle: "Date of birth", selectedDate: $selectedDate).padding()
            
            Button(action: {
                
                let firebaseAuth = Auth.auth()
             do {
               try firebaseAuth.signOut()
                 withAnimation{isLoggedIn = false}
             } catch let signOutError as NSError {
               print("Error signing out: %@", signOutError)
             }
            }, label: {Text(userData.phoneNumber)
                .foregroundColor(.blue)
            })
            
        }
        .navigationBarHidden(true)
        .navigationBarBackButtonHidden(true)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(User())
    }
}
